import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtille.dart';
import 'package:seriousgame/z_globals/z4_assets_manager.dart';
import 'package:universal_html/html.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../game_scene_generator.dart';

class DiabeteGameSceneMyrtille extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  // Myrtille
  late Myrtille myrtille;

  bool step1 = true; // Dialog Myrtille
  bool step2 = false; // Dialog Housband
  bool step3 = false; // find chest + questions
  bool step4 = false; // End

  bool step1IsDone = false;
  bool step2IsDone = false;
  bool step3IsDone = false;
  bool step4IsDone = false;

  // Scene component lifecycle handling section
  DiabeteGameSceneMyrtille({
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
    initMyrtille();
    //await initChest();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Moutarde in the scene
  void initMyrtille() {
    myrtille = Myrtille(GameImageAssets.myrtille)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    moutarde
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  /// Init the chest in the scene
  Future<void> initChest() async {
    //create chests
  }

  @override
  void update(double dt) {
    // Update the scene components
  }
}
