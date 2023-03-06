import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_1_manager.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../b_game_objects/b1_characters/moutarde.dart';
import '../../b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the Mission 1 - Mr Moutarde scene in the game
class DiabeteGameSceneMoutarde extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  // Mr Moutarde
  late Moutarde moutarde;

  // Moutarde steps
  bool step1 = true; // Dialog Mr Moutarde + question (choice 2)
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
  DiabeteGameSceneMoutarde({
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
    initMoutarde();
    await initChest();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Moutarde in the scene
  void initMoutarde() {
    moutarde = Moutarde()
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    moutarde
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  /// Init the Moutarde in the scene
  Future<void> initChest() async {
    final image = await Flame.images.load('gameObjects/bigChest.png');
    chest1 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter P",
      questMessage: QuestDialogsMission1.letterP,
      questType: "",
    );
    chest2 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter Q",
      questMessage: QuestDialogsMission1.letterQ,
      questType: "",
    );
    chest3 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter R",
      questMessage: QuestDialogsMission1.letterR,
      questType: "",
    );
    chest4 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter S",
      questMessage: QuestDialogsMission1.letterS,
      questType: "",
    );
    chest5 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter T",
      questMessage: QuestDialogsMission1.letterT,
      questType: "",
    );
    chest6 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter U",
      questMessage: QuestDialogsMission1.letterU,
      questType: "",
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (step1IsDone) {
      step1 = false;
      step1IsDone = false;
      step2 = true;
    }
    if (step2IsDone) {
      step2 = false;
      step2IsDone = false;

      // Add chests
      add(chest1);
      add(chest2);
      add(chest3);
      add(chest4);
      add(chest5);
      add(chest6);

      step3 = true;
    }

    if ((chest1 as ChestQuest).isOpened &&
        (chest2 as ChestQuest).isOpened &&
        (chest3 as ChestQuest).isOpened &&
        (chest4 as ChestQuest).isOpened &&
        (chest5 as ChestQuest).isOpened &&
        (chest6 as ChestQuest).isOpened &&
        step3) {
      step3 = false;
      step3IsDone = false;
      step4 = true;
    }

    if (step4IsDone) {
      step4 = false;
      step4IsDone = false;
      step5 = true;
      currentStep = 5;
    }

    if (currentStep == 6) {
      step5 = false;
      step5IsDone = false;
      canChangeScene = true;
      isDone = true;
    }
  }
}
