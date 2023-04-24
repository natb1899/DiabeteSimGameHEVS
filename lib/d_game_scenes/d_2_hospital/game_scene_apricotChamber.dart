import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/apricotHospital.dart';
import 'package:seriousgame/d_game_scenes/d_2_hospital/game_scene_nurseOffice.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

class DiabeteGameSceneApricotChamber extends DiabeteGameSceneNurseOffice {
  // Scene components list
  List<Component> sceneObjects = [];

  late ApricotHospital apricotHospital;
  PlayerScoreController playerScoreController;

  //Scene steps
  // bool step1 = false;
  // bool step2 = true;
  // bool step3 = false;
  // bool step4 = false;
  // bool step5 = false;
  // bool step1IsDone = true;
  // bool step2IsDone = false;
  // bool step3IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneApricotChamber({
    required String sceneTmx,
    required String sceneName,
    required String previousMissionName,
    required GameScenesController gameScenesController,
    required String soundTrackName,
    required GameSoundController gameSoundController,
    required this.playerScoreController,
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
    initApricot();
    await super.onLoad();
    continueInitialisation();
  }

  ///Init Apricot
  void initApricot() {
    apricotHospital = ApricotHospital(GameImageAssets.apricotHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Continue the scene initialisation
  void continueInitialisation() {
    apricotHospital
      ..debugMode = kDebugMode
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  //####################################

  @override
  void update(double dt) {
    super.update(dt);
    canChangeScene = true;
    //steps
    // if (step1IsDone) {
    //   step1 = false;
    //   step1IsDone = false;
    //   step2 = true;
    // }

    if (step2IsDone) {
      step2 = false;
      step2IsDone = false;
      step3 = true;
    }

    if (step3IsDone) {
      //Add 5 points to the score
      for (int i = 0; i < 5; i++) {
        playerScoreController.updateScore(true);
      }
      step3 = false;
      step3IsDone = false;
      isDone = true;
      canChangeScene = true;
      gameScenesController.level7done = true;
    }
  }
}
