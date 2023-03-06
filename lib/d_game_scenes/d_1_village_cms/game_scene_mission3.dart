import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../b_game_objects/b1_characters/brocoli.dart';
import '../../b_game_objects/b1_characters/brocoliSon.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the Mission 3 - Mr Brocoli scene in the game
class DiabeteGameSceneBrocoli extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late Brocoli brocoli;
  late BrocoliSon brocoliSon;

  //brocoliscène
  bool etape1 = true;
  bool etape2 = false;
  bool etape3 = false;
  bool etape4 = false;
  bool etape5 = false;
  bool etape6 = false;

  bool etape1IsDone = false;
  bool etape2IsDone = false;
  bool etape3IsDone = false;
  bool etape4IsDone = false;
  bool etape5IsDone = false;
  bool etape6IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneBrocoli({
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
    initBrocoli();
    initBrocoliSon();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Brocoli in the scene
  void initBrocoli() {
    brocoli = Brocoli(GameImageAssets.brocoli)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init the BrocoliSon in the scene
  void initBrocoliSon() {
    brocoliSon = BrocoliSon(GameImageAssets.brocoliSon)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    brocoli
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    brocoliSon
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  //#####################################

  @override
  void update(double dt) {
    super.update(dt);
    if (etape1IsDone) {
      etape1 = false;
      etape2 = true;
      etape1IsDone = false;
    }
    if (etape2IsDone) {
      etape2 = false;
      etape3 = true;
      etape2IsDone = false;
    }
    if (etape3IsDone) {
      etape3 = false;
      etape4 = true;
      etape3IsDone = false;
    }
    if (etape4IsDone) {
      etape4 = false;
      etape5 = true;
      etape4IsDone = false;
    }
    if (etape5IsDone) {
      etape5 = false;
      etape5IsDone = false;
      canChangeScene = true;
      isDone = true;
    }
    if (etape6IsDone) {
      etape6 = false;
      etape6IsDone = false;
    }
  }
}
