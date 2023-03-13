import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtille.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtilleHusband.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_1_manager.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_2_manager.dart';
import 'package:seriousgame/z_globals/z4_assets_manager.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
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
  bool step1 = true;
  bool step2 = false; //housband
  bool step3 = false; //chests
  bool step4 = false;

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
    initMyrtilleHusband();
    await initChest();
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

  Future<void> initChest() async {
    final image = await Flame.images.load('gameObjects/bigChest.png');
    QuestDialogsMission2 questDialogsMission2 = QuestDialogsMission2();
    chest1 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Neuropathy",
      questMessage: questDialogsMission2.neuropathy,
      questType: "question",
    );
    chest2 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "hypoglycemia",
      questMessage: questDialogsMission2.hyperglicemia,
      questType: "question",
    );
    chest3 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "visual",
      questMessage: questDialogsMission2.visual,
      questType: "question",
    );
    chest4 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "cardiovascular",
      questMessage: questDialogsMission2.cardiovascular,
      questType: "question",
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (step1IsDone) {
      step1 = false;
      step1IsDone = false;

      add(chest1);
      add(chest2);
      add(chest3);
      add(chest4);

      step2 = true;
    }
  }
}
