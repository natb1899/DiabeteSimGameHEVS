import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/measure_tool_controller.dart';
import 'package:seriousgame/a_overlays/a4_feedback/feedback_controller.dart';
import 'package:seriousgame/b_game_objects/b1_characters/apricotHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/asscHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/doctorHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseDiabetesHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseWoundCareHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/player.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b3_bag_objects/contact_controller.dart';
import 'package:seriousgame/d_game_scenes/d_2_hospital/game_scene_nurseOffice.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/notes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import 'package:seriousgame/z_globals/z14_dialog_mission_7_manager.dart';
import 'package:seriousgame/z_globals/z1_game_manager.dart';
import 'package:seriousgame/z_globals/z4_assets_manager.dart';

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

  DiabeteGameSceneNurseOffice diabeteGame = DiabeteGameSceneNurseOffice(
    sceneTmx: GameTilesAssets.nurseOffice,
    sceneName: GameScenes.atNurseOffice,
    previousMissionName: '',
    gameScenesController: gameController,
    soundTrackName: GameAudioAssets.funday,
    gameSoundController: gameSoundController,
  );

  group('Scene 7 tests', () {
    testWithGame<DiabeteGameSceneNurseOffice>(
        'Load correct tile', () => diabeteGame,
        (DiabeteGameSceneNurseOffice game) async {
      await game.ready();
      expect(game.sceneTmx, GameTilesAssets.nurseOffice);
      expect(game.sceneName, GameScenes.atNurseOffice);
    });
    testWithFlameGame('Load player in scene 7', (game) async {
      final player = PlayerComponent('player48x48.png')..addToParent(game);
      await game.ready();
      expect(player.isMounted, true);
    });
    testWithFlameGame('Load chests', (game) async {
      final image = await Flame.images.load('gameObjects/bigChest.png');

      final chest1 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: 'prevention',
          questMessage: QuestDialogsMission7.prevention,
          questType: '')
        ..addToParent(game);
      final chest2 = ChestQuest(
          sprite: Sprite(image),
          size: Vector2.all(32),
          anchor: Anchor.center,
          questName: 'treatment',
          questMessage: QuestDialogsMission7.treatment,
          questType: '')
        ..addToParent(game);

      await game.ready();
      expect(chest1.isMounted, true);
      expect(chest2.isMounted, true);
    });

    group('Load NPCs', () {
      testWithFlameGame('Mr. Apricot', (game) async {
        final component = ApricotHospital('Test')..addToParent(game);
        await game.ready();
        expect(component.isMounted, true);
      });
      testWithFlameGame('Apprentice nurse', (game) async {
        final component = AsscHospital('Test')..addToParent(game);
        await game.ready();
        expect(component.isMounted, true);
      });
      testWithFlameGame('Doctor', (game) async {
        final component = DoctorHospital('Test')..addToParent(game);
        await game.ready();
        expect(component.isMounted, true);
      });
      testWithFlameGame('Diabetes nurse', (game) async {
        final component = NurseDiabetesHospital('Test')..addToParent(game);
        await game.ready();
        expect(component.isMounted, true);
      });
      testWithFlameGame('Woundcare nurse', (game) async {
        final component = NurseWoundCareHospital('Test')..addToParent(game);
        await game.ready();
        expect(component.isMounted, true);
      });
    });
  });
}
