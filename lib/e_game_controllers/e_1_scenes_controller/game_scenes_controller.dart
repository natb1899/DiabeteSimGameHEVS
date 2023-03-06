import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../a_overlays/a2_bag_overlay/measure_tool_controller.dart';
import '../../a_overlays/a4_feedback/feedback_controller.dart';
import '../../b_game_objects/b2_map_objects/b3_bag_objects/contact_controller.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_mission1.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_mission3.dart';
import '../../d_game_scenes/d_2_hospital/game_scene_brocoliChamber.dart';
import '../../d_game_scenes/d_2_hospital/game_scene_hospitalInterior.dart';
import '../../d_game_scenes/d_2_hospital/game_scene_outsideHospital.dart';
import '../../d_game_scenes/game_base.dart';
import '../../d_game_scenes/game_scene_villageCMS.dart';
import '../../d_game_scenes/start_page_scene.dart';
import '../../y_common_widget/show_dialog_changeScene.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z3_strings_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../base_controller.dart';
import '../e_2_score_controller/player_score_controller.dart';
import '../e_3_bag_controller/notes_controller.dart';
import '../e_3_bag_controller/player_bag_controller.dart';

/// Controller for game scenes
class GameScenesController extends BaseController {
  late GameSoundController gameSoundController;
  late PlayerBagController bagController;
  late PlayerScoreController scoreController;
  late GameDialogController gameDialogController;
  late ConfigButtonController configButtonController;
  late MeasureToolController measureToolController;
  late ContactsController contactsController;
  late NotesController notesController;
  late FeedBackController feedBackController;

  late DiabeteGameBase _currentScene;

  late Map<String, DiabeteGameBase> _sceneRouter;

  late StreamController<DiabeteGameBase> _gameScenesController;

  late Sink<DiabeteGameBase> _moveToNextScene;

  Stream<DiabeteGameBase> get currentScene => _gameScenesController.stream;

  DiabeteGameBase get scene => _currentScene;

  Map<String, DiabeteGameBase> get sceneRouter => _sceneRouter;

  /// Launch the controller
  @override
  void start() {
    _gameScenesController = StreamController<DiabeteGameBase>();
    _moveToNextScene = _gameScenesController.sink;

    _sceneRouter = {
      GameScenes.startPage: StartPage(
        gameScenesController: this,
        gameSoundController: gameSoundController,
        soundTrackName: GameAudioAssets.goinghigher,
        sceneName: GameScenes.startPage,
        previousMissionName: '',
      ),
      GameScenes.villageCMS: VillageCMSScene(
        sceneName: GameScenes.villageCMS,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.villageCMS,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.funday,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atMoutardeHome: DiabeteGameSceneMoutarde(
        sceneName: GameScenes.atMoutardeHome,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.moutardeHome,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atBrocoliHome: DiabeteGameSceneBrocoli(
        sceneName: GameScenes.atBrocoliHome,
        previousMissionName: GameScenes.atMoutardeHome,
        sceneTmx: GameTilesAssets.brocoliHome,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.outsideHospital: DiabeteGameSceneOutsideHospital(
        sceneName: GameScenes.outsideHospital,
        previousMissionName: GameScenes.villageCMS,
        // '', to go faster
        sceneTmx: GameTilesAssets.outsideHospital,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atHospitalInterior: DiabeteGameSceneHospitalInterior(
        sceneName: GameScenes.atHospitalInterior,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.hospitalInterior,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atBrocoliChamber: DiabeteGameSceneBrocoliChamber(
        sceneName: GameScenes.atBrocoliChamber,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.brocoliChamber,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
    };
    _currentScene = _sceneRouter[GameScenes.startPage]!;
  }

  /// Load new scene with router
  void goToScene(String gameScene) {
    final nextScene = _sceneRouter[gameScene]!;
    final nextScenePreviousMission =
        _sceneRouter[nextScene.previousMissionName];

    debugPrint('nextScene : $nextScene');
    debugPrint('previousMission : $nextScenePreviousMission');

    // If the scene has already been done, display dialog
    if (nextScene.isDone) {
      displayAccomplishedMissionMessage(gameScene);

      // The previous scene isn't done (expect if you want to go to Village)
    } else if (nextScene.previousMissionName != '' &&
        !nextScenePreviousMission!.isDone) {
      displayMustAccomplishPreviousMissionMessage(gameScene);
    } else {
      changeToNextScene(nextScene);
    }

    // The village CMS is completed if Mr. Brocoli has been visited
    if (_sceneRouter[GameScenes.atBrocoliHome]!.isDone &&
        nextScene.sceneName == GameScenes.villageCMS) {
      // Display the dialog to check the notes
      Future.delayed(
          const Duration(seconds: 1),
          () => gameDialogController.onDialog(DialogModel(
                isShowDialog: true,
                dialogMessage: GameDialogs.transmissionBrocoli,
                hasInteraction: true,
                dialogInteractions: [
                  [
                    GameInteractionTypes.notes,
                    GameCharacters.brocoli,
                    "Examen clinique : Patient somnole mais réveillable lors de la stimulation verbale. \n"
                        "Désorienté dans le temps et l’espace. Orienté pour les personnes. \n"
                        "Paramètres vitaux : TA = 100/60 mmHg, FC= 98 bpm, FR = 22/min, sat = 90%, température = 37.5oC. La glycémie est à 40 mmol/L."
                  ],
                  [
                    GameInteractionTypes.notes,
                    GameCharacters.brocoli,
                    "Appel du médecin traitant pour un état hyperglycémique avancé. Recommande d’appeler une ambulance."
                  ],
                  [
                    GameInteractionTypes.notes,
                    GameCharacters.brocoli,
                    "Patient prise en charge par une ambulance pour un risque de coma hyperosmolaire."
                  ],
                ],
              )));
    }
  }

  /// Load the next scene
  void changeToNextScene(DiabeteGameBase nextScene) {
    _currentScene = nextScene;

    // Once we enter the scene, we can't leave until we finish the mission
    if (_currentScene.sceneName != GameScenes.villageCMS) {
      _currentScene.canChangeScene = false;
    }

    _moveToNextScene.add(_currentScene);
    bagController.game = _currentScene;

    try {
      _currentScene.resumeScene();
    } catch (e) {
      // will be solved by scheduler
    }
    gameSoundController.inputPlayMusic.add(true);
  }

  /// Alert the user that he must accomplish previous missions
  void displayMustAccomplishPreviousMissionMessage(String gameScene) {
    switch (gameScene) {
      // You want to visit Mr Brocoli before Mr Moutarde
      case GameScenes.atBrocoliHome:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.visitMoutardeBefore),
        );
        break;
      case GameScenes.outsideHospital:
        // Different message if the chests are displayed or not
        if ((_sceneRouter[GameScenes.villageCMS]! as VillageCMSScene)
            .chestIsAdded) {
          gameDialogController.onDialog(
            DialogModel(
                isShowDialog: true,
                dialogMessage: GameDialogs.unlockCMSChestsBefore),
          );
        } else {
          gameDialogController.onDialog(
            DialogModel(
                isShowDialog: true, dialogMessage: GameDialogs.finishCMSBefore),
          );
        }
        break;
    }
  }

  /// Alert the user that he has already accomplished the mission
  void displayAccomplishedMissionMessage(String gameScene) {
    switch (gameScene) {
      case GameScenes.atMoutardeHome:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToMoutardeHome),
        );
        break;
      case GameScenes.villageCMS:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToVillageCMS),
        );
        break;
      default:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToDefaultScene),
        );
    }
  }

  /// Call existing scene with router
  void openScene(String gameScene) {
    switch (gameScene) {
      case GameScenes.villageCMS:
        _currentScene = _sceneRouter[gameScene]!;
        _moveToNextScene.add(_currentScene);
        bagController.game = _currentScene;
        gameSoundController.inputPlayMusic.add(true);
        Future.delayed(const Duration(milliseconds: 1500), () {
          gameDialogController
              .sendInitialMessage(GameDialogs.initialVillageMesssage);
        });
        scene.soundState = true;
        break;

      case GameScenes.atBrocoliHome:
        _currentScene = _sceneRouter[gameScene]!;
        _moveToNextScene.add(_currentScene);
        bagController.game = _currentScene;
        gameSoundController.inputPlayMusic.add(true);
        Future.delayed(const Duration(milliseconds: 1500), () {
          gameDialogController
              .sendInitialMessage(GameDialogs.initialBrocoliHome);
        });
        scene.soundState = true;
        break;

      case GameScenes.atMoutardeHome:
        _currentScene = _sceneRouter[gameScene]!;
        _moveToNextScene.add(_currentScene);
        bagController.game = _currentScene;
        gameSoundController.inputPlayMusic.add(true);
        Future.delayed(const Duration(milliseconds: 1500), () {
          gameDialogController.sendInitialMessage("test");
        });
        scene.soundState = true;
        break;
      default:
    }
  }

  /// Ends the controller
  @override
  void dispose() {
    _gameScenesController.close();
  }

  endScene(
      {required BuildContext context,
      required String content,
      required String title,
      required String nextScene,
      String? imageUrl}) {
    scene.isDone = true;
    scene.canChangeScene = true;
    Future.delayed(
        const Duration(seconds: 1),
        () => showChangeSceneDialog(context,
            content: content,
            imageUrl: imageUrl ?? "",
            defaultActionText: 'OK',
            title: title,
            gameScenesController: this,
            nextScene: nextScene));
  }

  showFeedback() {
    scene.isDone = true;
    scene.canChangeScene = true;
    feedBackController.inputfeedback.add(true);
  }
}
