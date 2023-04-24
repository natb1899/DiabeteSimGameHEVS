import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/fraiseux.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z15_dialog_mission_5_manager.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

class DiabeteGameSceneFraiseuxChamber extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late Fraiseux fraiseux;
  PlayerScoreController playerScoreController;

  //Scene steps
  bool step1 = true;
  bool step2 = false;
  bool step3 = false;

  bool step1IsDone = false;
  bool step2IsDone = false;
  bool step3IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneFraiseuxChamber({
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
    initFraiseux();
    await initChest();
    await super.onLoad();
    continueInitialisation();
  }

  ///Init Fraiseux
  void initFraiseux() {
    fraiseux = Fraiseux(GameImageAssets.fraiseux)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Continue the scene initialisation
  void continueInitialisation() {
    fraiseux
      ..debugMode = kDebugMode
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  //InitChest
  Future<void> initChest() async {
    final imageCigarettes =
        await Flame.images.load('gameObjects/marlboro-small.png');
    final imageCellphone = await Flame.images.load('gameObjects/cellphone.png');
    final imageSportsClubBrochure =
        await Flame.images.load('gameObjects/sports-club-magazine-small.png');
    final imageMilkChocolate =
        await Flame.images.load('gameObjects/milk-chocolate.png');
    QuestDialogsMission5 questDialogsMission5 = QuestDialogsMission5();
    chest1 = ChestQuest(
        sprite: Sprite(imageCigarettes),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: "Cigarette",
        questMessage: questDialogsMission5.cigarettes,
        questType: "question");
    chest2 = ChestQuest(
        sprite: Sprite(imageMilkChocolate),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: "Chocolate",
        questMessage: questDialogsMission5.milkChocolat,
        questType: "question");
    chest3 = ChestQuest(
        sprite: Sprite(imageSportsClubBrochure),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: "Brochure",
        questMessage: questDialogsMission5.sportsClubBrochure,
        questType: "question");
    chest4 = ChestQuest(
        sprite: Sprite(imageCellphone),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: "Cellphone",
        questMessage: questDialogsMission5.cellPhone,
        questType: "question");
  }

  //####################################

  @override
  void update(double dt) {
    super.update(dt);
    //steps
    if (step1IsDone) {
      add(chest1);
      add(chest2);
      add(chest3);
      add(chest4);
      step1 = false;
      step2 = true;
      step1IsDone = false;
    }
    if ((chest1 as ChestQuest).isOpened &&
        (chest2 as ChestQuest).isOpened &&
        (chest3 as ChestQuest).isOpened &&
        (chest4 as ChestQuest).isOpened &&
        step2) {
      step2 = false;
      step3 = true;
      step2IsDone = false;
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
    }
  }
}
