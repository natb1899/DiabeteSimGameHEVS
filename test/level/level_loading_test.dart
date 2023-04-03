import 'package:flame_test/flame_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_Login/login_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/measure_tool_controller.dart';
import 'package:seriousgame/a_overlays/a4_feedback/feedback_controller.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b3_bag_objects/contact_controller.dart';
import 'package:seriousgame/d_game_scenes/d_2_hospital/game_scene_hospitalInterior.dart';
import 'package:seriousgame/d_game_scenes/d_2_hospital/game_scene_outsideHospital.dart';
import 'package:seriousgame/d_game_scenes/game_scene_villageCMS.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/notes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
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
  final LoginButtonController loginButtonController = LoginButtonController();

  gameController.gameSoundController = gameSoundController;
  gameController.bagController = bagController;
  gameController.scoreController = scoreController;
  gameController.gameDialogController = gameDialogController;
  gameController.configButtonController = configButtonController;
  gameController.loginButtonController = loginButtonController;
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
  loginButtonController.start();

  VillageCMSScene villageCMS = VillageCMSScene(
    sceneTmx: GameTilesAssets.villageCMS,
    sceneName: GameScenes.villageCMS,
    previousMissionName: '',
    gameScenesController: gameController,
    soundTrackName: GameAudioAssets.funday,
    gameSoundController: gameSoundController,
  );

  DiabeteGameSceneOutsideHospital hospitalOutside =
      DiabeteGameSceneOutsideHospital(
    sceneTmx: GameTilesAssets.outsideHospital,
    sceneName: GameScenes.outsideHospital,
    previousMissionName: '',
    gameScenesController: gameController,
    soundTrackName: GameAudioAssets.funday,
    gameSoundController: gameSoundController,
  );
  DiabeteGameSceneHospitalInterior hospitalInterior =
      DiabeteGameSceneHospitalInterior(
    sceneTmx: GameTilesAssets.hospitalInterior,
    sceneName: GameScenes.atHospitalInterior,
    previousMissionName: '',
    gameScenesController: gameController,
    soundTrackName: GameAudioAssets.funday,
    gameSoundController: gameSoundController,
  );

  group('Level loading', () {
    testWithGame<VillageCMSScene>('Village CMS', () => villageCMS,
        (VillageCMSScene game) async {
      await game.ready();
      expect(game.sceneTmx, GameTilesAssets.villageCMS);
      expect(game.sceneName, GameScenes.villageCMS);
    });
    testWithGame<DiabeteGameSceneOutsideHospital>(
        'Hospital outside', () => hospitalOutside,
        (DiabeteGameSceneOutsideHospital game) async {
      await game.ready();
      expect(game.sceneTmx, GameTilesAssets.outsideHospital);
      expect(game.sceneName, GameScenes.outsideHospital);
    });
    testWithGame<DiabeteGameSceneHospitalInterior>(
        'Hospital interior', () => hospitalInterior,
        (DiabeteGameSceneHospitalInterior game) async {
      await game.ready();
      expect(game.sceneTmx, GameTilesAssets.hospitalInterior);
      expect(game.sceneName, GameScenes.atHospitalInterior);
    });
  });
}
