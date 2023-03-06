import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';

import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../b_game_objects/b1_characters/player.dart';
import '../c_game_loaders/scene_objects_loader.dart';
import '../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../z_globals/z1_game_manager.dart';
import '../z_globals/z4_assets_manager.dart';
import 'game_base.dart';

/// Loader of the different scenes in the game
class DiabeteGameScene extends DiabeteGameBase
    with KeyboardEvents, HasCollisionDetection, HasTappableComponents {
  // Characters spawn points
  late Map<String, Vector2> charactersSpawnPoints;

  // Tiles scene support
  late TiledComponent sceneMap;
  String sceneTmx;

  // Scene size
  late double mapWidth;
  late double mapHeight;

  // Scene components list
  List<Component> sceneObjects = [];

  //###########################################
  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameScene({
    required this.sceneTmx,
    required String sceneName,
    required String previousMissionName,
    required GameScenesController gameScenesController,
    required String soundTrackName,
    required GameSoundController gameSoundController,
  }) : super(
          soundTrackName: soundTrackName,
          gameScenesController: gameScenesController,
          gameSoundController: gameSoundController,
          sceneName: sceneName,
          previousMissionName: previousMissionName,
        );

  /// Initiate the scene loader
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sceneMap = await initMap();
    initPlayer();
    loadSceneComponents();
    initCamera();
    if (sceneName == GameScenes.villageCMS) {
      player.canMove = false;
      FlameAudio.bgm.initialize();
    }
  }

  //#####################################
  // SCENE INITIALISATION SECTION

  /// Init the map (scene, width, height)
  Future<TiledComponent<FlameGame>> initMap() async {
    final sceneMap =
        await TiledComponent.load(sceneTmx, Vector2.all(GameParams.spriteSize));
    addToScene(sceneMap);

    mapWidth = sceneMap.tileMap.map.width * GameParams.spriteSize;

    mapHeight = sceneMap.tileMap.map.height * GameParams.spriteSize;
    return sceneMap;
  }

  /// Init the player in the scene
  void initPlayer() {
    player = PlayerComponent(GameImageAssets.user)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.bottomCenter
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  /// Load the scene components (objects) in the scene
  void loadSceneComponents() {
    GameSceneLoader.loadSceneComponents(
      game: this,
      sceneMap: sceneMap,
    );
  }

  /// Set the parameters for the camera
  void initCamera() {
    camera.followComponent(player,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  /// Generic method the add any component to the scene
  void addToScene(PositionComponent object) {
    add(object);
    sceneObjects.add(object);
  }

  /// Scene keyboard handling
  @override
  material.KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    print("key pressed" +
        keysPressed
            .toString()); ///////////////////////////////////////////////////////////////////
    try {
      if (player.canMove) {
        print(
            "player can move"); ///////////////////////////////////////////////////////////////////////
        final isKeyDown = event is RawKeyDownEvent;
        if (isKeyDown) {
          print(
              "player is moving"); ///////////////////////////////////////////////////////////////////////
          player.setOnMovePlayerDirection(keysPressed);
          return material.KeyEventResult.handled;
        } else {
          player.setOnIdlePlayerDirection();
        }
      }
    } catch (_) {
      // LateInitializationError :
      //if happen it will be solved by the game loop

    }

    return material.KeyEventResult.ignored;
  }

  //#####################################
  // SCENE FLAME ENGINE HANDLING SECTION

  /// Stop the scene
  void stopScene() {
    player
      ..position.y +=
          player.playerMovementDirection == PlayerBehavior.isIdleDown ? -16 : 10
      ..playerMovementDirection =
          player.playerMovementDirection == PlayerBehavior.isIdleDown
              ? PlayerBehavior.isIdleUp
              : PlayerBehavior.isIdleDown;
    player.canMove = false;
  }

  /// Resume the scene
  @override
  void resumeScene() {
    player.moveAnimation();
    player.canMove = true;
  }
}
