import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/measure_tool_controller.dart';
import 'package:seriousgame/a_overlays/a4_feedback/feedback_controller.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtille.dart';
import 'package:seriousgame/b_game_objects/b1_characters/myrtilleHusband.dart';
import 'package:seriousgame/b_game_objects/b1_characters/player.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b3_bag_objects/contact_controller.dart';
import 'package:seriousgame/d_game_scenes/d_1_village_cms/game_scene_mission2.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/notes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_2_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final GameScenesController gameController = GameScenesController();
  final GameSoundController gameSoundController = GameSoundController();
  final PlayerBagController bagController = PlayerBagController();
  final PlayerScoreController scoreController = PlayerScoreController();
  final GameDialogController gameDialogController = GameDialogController();
  final FeedBackController feedBackController = FeedBackController();
  final ConfigButtonController configButtonController =
      ConfigButtonController();
  final MeasureToolController measureToolController = MeasureToolController();
  final ContactsController contactsController = ContactsController();
  final NotesController notesController = NotesController();

  gameController.gameSoundController = gameSoundController;
  gameController.bagController = bagController;
  gameController.scoreController = scoreController;
  gameController.gameDialogController = gameDialogController;
  gameController.configButtonController = configButtonController;
  gameController.notesController = notesController;
  gameController.measureToolController = measureToolController;
  gameDialogController.gameSceneController = gameController;
  gameController.contactsController = contactsController;
  gameController.feedBackController = feedBackController;

  gameController.start();
  bagController.start();
  scoreController.start();
  gameDialogController.start();
  gameSoundController.start();
  configButtonController.start();
  feedBackController.start();

  DiabeteGameSceneMyrtille diabeteGame = DiabeteGameSceneMyrtille(
    sceneTmx: 'myrtille_home.tmx',
    sceneName: 'scene_2',
    previousMissionName: 'mission_2',
    gameScenesController: gameController,
    soundTrackName: 'funday.mp3',
    gameSoundController: gameSoundController,
  );

  group('Scene 2', () {
    testWithGame<DiabeteGameSceneMyrtille>(
        'Load correct tile', () => diabeteGame,
        (DiabeteGameSceneMyrtille game) async {
      await game.ready();
      expect(game.sceneTmx, 'myrtille_home.tmx');
      expect(game.sceneName, 'scene_2');
    });
    testWithFlameGame('Load player to game', (game) async {
      var player = PlayerComponent('player48x48.png')..addToParent(game);
      await game.ready();
      expect(player.isMounted, true);
    });
    testWithFlameGame('Load Mrs. Myrtille to game', (game) async {
      final mrsMyrtille = Myrtille('Test')..addToParent(game);
      await game.ready();
      expect(mrsMyrtille.isMounted, true);
    });
    testWithFlameGame('Load Mr. Myrtille to game', (game) async {
      final mrMyrtille = MyrtilleHusband('Test')..addToParent(game);
      await game.ready();
      expect(mrMyrtille.isMounted, true);
    });
    testWithFlameGame('Load chests', (game) async {
      final image = await Flame.images.load('gameObjects/bigChest.png');
      QuestDialogsMission2 questDialogsMission2 = QuestDialogsMission2();

      final chest1 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: 'neuropathy',
          questMessage: questDialogsMission2.neuropathy,
          questType: 'question')
        ..addToParent(game);
      final chest2 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: "hypoglycemia",
          questMessage: questDialogsMission2.hyperglicemia,
          questType: "question")
        ..addToParent(game);
      final chest3 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: "visual",
          questMessage: questDialogsMission2.visual,
          questType: "question")
        ..addToParent(game);
      final chest4 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: "cardiovascular",
          questMessage: questDialogsMission2.cardiovascular,
          questType: "question")
        ..addToParent(game);

      await game.ready();
      expect(chest1.isMounted, true);
      expect(chest2.isMounted, true);
      expect(chest3.isMounted, true);
      expect(chest4.isMounted, true);
    });
  });
}
