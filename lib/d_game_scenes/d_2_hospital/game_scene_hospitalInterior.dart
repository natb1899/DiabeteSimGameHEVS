import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/brocoliHospital.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../b_game_objects/b1_characters/guy01.dart';
import '../../b_game_objects/b1_characters/guy02.dart';
import '../../b_game_objects/b1_characters/nurse01.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the different scenes in the game
class DiabeteGameSceneHospitalInterior extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late Nurse01 nurse01;
  late Guy01 guy01;
  late Guy02 guy02;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION
  DiabeteGameSceneHospitalInterior({
    required String sceneTmx,
    required String sceneName,
    required String previousMissionName,
    required GameScenesController gameScenesController,
    required String soundTrackName,
    required GameSoundController gameSoundController,
  }) : super(
          sceneTmx: sceneTmx,
          soundTrackName: soundTrackName,
          gameScenesController: gameScenesController,
          gameSoundController: gameSoundController,
          sceneName: sceneName,
          previousMissionName: previousMissionName,
        );

  /// Initiate the scene loader
  @override
  Future<void>? onLoad() async {
    initNurse01();
    initGuy01();
    initGuy02();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the PNJ in the scene
  void initNurse01() {
    nurse01 = Nurse01(GameImageAssets.nurse01)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }
  void initGuy01() {
    guy01 = Guy01(GameImageAssets.guy01)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }
  void initGuy02() {
    guy02 = Guy02(GameImageAssets.guy02)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }


  void continueInitialisation() {
    nurse01
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    guy01
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    guy02
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  @override
  void update(double dt) {
    super.update(dt);
    canChangeScene = true;
  }
  //#####################################

}
