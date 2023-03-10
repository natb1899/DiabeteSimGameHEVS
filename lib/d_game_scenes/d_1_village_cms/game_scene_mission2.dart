import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtille.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtilleHusband.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
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
    chest1 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter P",
      questMessage: QuestDialogsMission2.question1,
      questType: "question",
    );
    chest2 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter Q",
      questMessage: QuestDialogsMission2.question2,
      questType: "question",
    );
    chest3 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter R",
      questMessage: QuestDialogsMission2.question3,
      questType: "question",
    );
    chest4 = ChestQuest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      questName: "Letter S",
      questMessage: QuestDialogsMission2.question4,
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

class QuestDialogsMission2 {
  static Map<String, dynamic> question1 = getQuestion(
      'Question 7 mission 1:',
      'Phrase 6 :\n\nMa douleur à la tête est forte. Je la situe à 6/10. C’est comme si quelqu’un me comprimait la tête. Je ressens également comme une sensation de fatigue générale.',
      'q',
      'Ce n’est pas la bonne réponse. Retentez !',
      'Vous perdez 1 point sur la barre de qualité des soins.',
      true,
      'Félicitations !',
      'Vous gagnez 1 point sur la barre de qualité des soins !',
      'Encore une mauvaise réponse.');
  static Map<String, dynamic> question2 = getQuestion(
      'Question 7 mission 1:',
      'Phrase 6 :\n\nMa douleur à la tête est forte. Je la situe à 6/10. C’est comme si quelqu’un me comprimait la tête. Je ressens également comme une sensation de fatigue générale.',
      'q',
      'Ce n’est pas la bonne réponse. Retentez !',
      'Vous perdez 1 point sur la barre de qualité des soins.',
      true,
      'Félicitations !',
      'Vous gagnez 1 point sur la barre de qualité des soins !',
      'Encore une mauvaise réponse.');
  static Map<String, dynamic> question3 = getQuestion(
      'Question 7 mission 1:',
      'Phrase 6 :\n\nMa douleur à la tête est forte. Je la situe à 6/10. C’est comme si quelqu’un me comprimait la tête. Je ressens également comme une sensation de fatigue générale.',
      'q',
      'Ce n’est pas la bonne réponse. Retentez !',
      'Vous perdez 1 point sur la barre de qualité des soins.',
      true,
      'Félicitations !',
      'Vous gagnez 1 point sur la barre de qualité des soins !',
      'Encore une mauvaise réponse.');
  static Map<String, dynamic> question4 = getQuestion(
      'Question 7 mission 1:',
      'Phrase 6 :\n\nMa douleur à la tête est forte. Je la situe à 6/10. C’est comme si quelqu’un me comprimait la tête. Je ressens également comme une sensation de fatigue générale.',
      'q',
      'Ce n’est pas la bonne réponse. Retentez !',
      'Vous perdez 1 point sur la barre de qualité des soins.',
      true,
      'Félicitations !',
      'Vous gagnez 1 point sur la barre de qualité des soins !',
      'Encore une mauvaise réponse.');

  static Map<String, dynamic> getQuestion(
      String questionTitle,
      String question,
      String questionAnswer,
      String falseAnswer,
      String falseAswersContent,
      bool retry,
      String trueAswers,
      String trueAswersContent,
      String falseAswersContentbutnoLose) {
    return {
      "questionTitle": questionTitle,
      "question": question,
      "answer": questionAnswer,
      "falseAswers": falseAnswer,
      "falseAswersContent": falseAswersContent,
      "retry": retry,
      "trueAswers": trueAswers,
      "trueAswersContent": trueAswersContent,
      "falseAswersContentbutnoLose": falseAswersContentbutnoLose,
    };
  }
}
