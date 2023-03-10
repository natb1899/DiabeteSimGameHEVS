import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtille.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtilleHusband.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_1_manager.dart';
import 'package:seriousgame/z_globals/z4_assets_manager.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the Mission 2 - Mrs Myrtille scene in the game
class DiabeteGameSceneMyrtille extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  // Mrs Myrtille
  late Myrtille myrtille;
  late MyrtilleHusband myrtilleHusband;

  // Myrtille steps
  bool step1 = true; // Dialog Mrs Myrtille + question (choice 2)
  bool step2 = false; // Find 6 chests
  bool step3 = false;
  bool step4 =
      false; // Resolve 6 phrases + next step (choice 3) + Vital sign measurements + next step (choice 1) + Hypoglycemic state
  bool step5 = false; // Went to fridge + question food

  bool step1IsDone = false;
  bool step2IsDone = false;
  bool step3IsDone = false;
  bool step4IsDone = false;
  bool step5IsDone = false;

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
    initMyrtilleHusband();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Myrtille in the scene
  void initMyrtille() {
    myrtille = Myrtille(GameImageAssets.myrtille)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init the MyrtilleHusband in the scene
  void initMyrtilleHusband() {
    myrtilleHusband = MyrtilleHusband(GameImageAssets.myrtilleHusband)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    myrtille
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    myrtilleHusband
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (step1IsDone) {
      step1 = false;
      step1IsDone = false;
      step2 = true;
    }
  }
}
