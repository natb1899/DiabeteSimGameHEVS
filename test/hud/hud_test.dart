import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_2_pause/pause_game.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/game_bundle_left_manager.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_2_game_bundle_right/a1_1_2_1_text_score/text_score.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_2_game_bundle_right/a1_1_2_2_slider_score/slider_score.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_2_game_bundle_right/a1_1_2_3_bag_button/bag_button.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_2_game_bundle_right/game_bundle_right_manager.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/game_bundles_manager.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/measure_tool_controller.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/player_bag_manager.dart';
import 'package:seriousgame/a_overlays/a4_feedback/feedback_controller.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b3_bag_objects/contact_controller.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b3_bag_objects/contact_onBag.dart';
import 'package:seriousgame/d_game_scenes/game_scene_generator.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/notes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/player_bag_controller.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(
      home: Scaffold(
    body: child,
  ));
}

void main() {
  group('HUD tests', () {
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

    DiabeteGameScene diabeteGame = DiabeteGameScene(
      sceneTmx: 'assets/tmx/scene_1.tmx',
      sceneName: 'scene_1',
      previousMissionName: 'mission_1',
      gameScenesController: gameController,
      soundTrackName: 'funday.mp3',
      gameSoundController: gameSoundController,
    );
    GameBundlesManager manager = GameBundlesManager(
      game: diabeteGame,
      overlaysSize: 32,
      playerBagController: bagController,
      playerScoreController: scoreController,
      gameDialogController: gameDialogController,
      gameSoundController: gameSoundController,
      configButtonController: configButtonController,
    );

    testWidgets('Hud manager is loaded', (tester) async {
      await tester.pumpWidget(makeTestableWidget(manager));
      await tester.pumpAndSettle();
      expect(find.byType(GameBundlesManager), findsOneWidget);
      expect(find.byType(GameBundleLeft), findsOneWidget);
      expect(find.byType(GameBundleRight), findsOneWidget);
    });

    testWidgets("BundleLeft is loaded with sound, config and pause butttons",
        (tester) async {
      await tester.pumpWidget(makeTestableWidget(GameBundleLeft(
        game: manager.game,
        overlaysSize: manager.overlaysSize,
        gameDialogController: manager.gameDialogController,
        playerScoreController: manager.playerScoreController,
        gameSoundController: manager.gameSoundController,
        configButtonController: manager.configButtonController,
      )));
      await tester.pumpAndSettle();
      expect(find.byType(SoundOverlay), findsOneWidget);
      expect(find.byType(ConfigOverlay), findsOneWidget);
      expect(find.byType(PauseOverlay), findsOneWidget);
    });

    testWidgets("BundleRight is loaded with score and bag", (tester) async {
      await tester.pumpWidget(makeTestableWidget(GameBundleRight(
        game: manager.game,
        overlaysSize: manager.overlaysSize,
        playerBagController: manager.playerBagController,
        playerScoreController: manager.playerScoreController,
      )));
      await tester.pumpAndSettle();
      expect(find.byType(TextScoreOverlay), findsOneWidget);
      expect(find.byType(SliderScoreOverlay), findsOneWidget);
      expect(find.byType(BagButtonsOverlay), findsOneWidget);
    });

    testWidgets("play and pause sound", (tester) async {
      await tester.pumpWidget(makeTestableWidget(SoundOverlay(
        gameSoundController: gameSoundController,
        overlaysSize: 32,
        flag: true,
        game: diabeteGame,
      )));
      await tester.pumpAndSettle();
      expect(find.byType(SoundOverlay), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.volume_up_rounded), findsOneWidget);
      //expect(FlameAudio.bgm.isPlaying, true);
      await tester.press(find.byIcon(Icons.volume_up_rounded));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.volume_off_rounded), findsOneWidget);
      //expect(FlameAudio.bgm.isPlaying, false);
    });

    testWidgets('PlayerBackpack tabs and close button are correctly rendered',
        (tester) async {
      await tester.pumpWidget(makeTestableWidget(PlayerBag(
        game: diabeteGame,
        gameScenesController: gameController,
        playerBagController: bagController,
      )));

      // Check there are 5 tabs icons
      expect(find.byIcon(Icons.health_and_safety), findsOneWidget);
      expect(find.byIcon(Icons.calendar_month), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.school), findsOneWidget);

      // Close button is also displayed
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('PlayerBag tabs work', (tester) async {
      await tester.pumpWidget(makeTestableWidget(PlayerBag(
        game: diabeteGame,
        gameScenesController: gameController,
        playerBagController: bagController,
      )));

      // Should initiate on first tab
      expect(find.text('Outils de mesure :'), findsOneWidget);

      // Second tab
      await tester.tap(find.byIcon(Icons.calendar_month));
      await tester.pumpAndSettle();
      expect(find.text('Patients du village'), findsOneWidget);

      // Third tab
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      expect(find.text('Situations des patients'), findsOneWidget);

      // Fourth tab, find contactview widget
      await tester.tap(find.byIcon(Icons.email));
      await tester.pumpAndSettle();
      expect(find.byType(ContactView), findsOneWidget);

      // Last tab
      await tester.tap(find.byIcon(Icons.school));
      await tester.pumpAndSettle();
      expect(find.text("collection d'apprentissage"), findsOneWidget);
    });
  });
}
