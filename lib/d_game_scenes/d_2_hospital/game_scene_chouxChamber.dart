import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/d_game_scenes/game_scene_generator.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../b_game_objects/b1_characters/choux.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';

class DiabeteGameSceneChouxChamber extends DiabeteGameScene {
  List<Component> sceneObjects = [];

  // Ms Choux
  late Choux choux;

  // Scene steps
  bool step1 = true;

  bool step1IsDone = false;

  DiabeteGameSceneChouxChamber({
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
    initChoux();
    await super.onLoad();
    continueInitialisation();
  }

  ///Init Choux
  void initChoux() {
    choux = Choux()
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Continue the scene initialisation
  void continueInitialisation() {
    choux
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  /// Update
  @override
  void update(double dt) {
    super.update(dt);
    if (step1IsDone) {
      step1 = false;
      step1IsDone = false;
      isDone = true;
      canChangeScene = true;
    }
  }
}
