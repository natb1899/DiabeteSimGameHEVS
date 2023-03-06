import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/brocoliHospital.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the different scenes in the game
class DiabeteGameSceneBrocoliChamber extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late BrocoliHospital brocoliHospital;

  //brocoliscène
  bool BroHopStep1 = true;
  bool BroHopStep2 = false;

  bool BroHopStep1IsDone = false;
  bool BroHopStep2IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneBrocoliChamber({
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
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Brocoli in the scene
  void initBrocoli() {
    brocoliHospital = BrocoliHospital(GameImageAssets.brocoliHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    brocoliHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  //#####################################

  @override
  void update(double dt) {
    super.update(dt);
    if (BroHopStep1IsDone) {
      BroHopStep1 = false;
      BroHopStep2 = true;
      BroHopStep1IsDone = false;
      canChangeScene = true;
      isDone = true;
    }
    if (BroHopStep2IsDone) {
      BroHopStep2 = false;
      BroHopStep2IsDone = false;
    }
  }
}
