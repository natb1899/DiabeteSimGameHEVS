import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';

import 'package:seriousgame/b_game_objects/b1_characters/apricotHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/asscHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/doctorHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseDiabetesHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseWoundCareHospital.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/d_game_scenes/game_scene_generator.dart';
import 'package:seriousgame/z_globals/z14_dialog_mission_7_manager.dart';
import 'package:seriousgame/z_globals/z1_game_manager.dart';
import 'package:seriousgame/z_globals/z4_assets_manager.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';

/// Loader of the Mission 7 - Mr Apricot in the hospital
class DiabeteGameSceneNurseOffice extends DiabeteGameScene {
  List<Component> sceneObjects = [];

  // Characters
  late DoctorHospital doctorHospital;
  late AsscHospital asscHospital;
  late NurseDiabetesHospital nurseDiabetesHospital;
  late NurseWoundCareHospital nurseWoundCareHospital;

  // Mission steps
  bool step1 = true; // Doctor
  bool step2 = false; // Mr. Apricot
  bool step3 = false; // Assistant Nurse
  bool step4 = false; // Diabetes Nurse
  bool step5 = false; // Woundcare Nurse
  bool step6 = false; // Done with all

  bool step1IsDone = false;
  bool step2IsDone = false;
  bool step3IsDone = false;
  bool step4IsDone = false;
  bool step5IsDone = false;
  bool step6IsDone = false;

  // Scene component lifecycle handling section
  DiabeteGameSceneNurseOffice({
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
    initDoctorHospital();
    initAsscHospital();
    initNurseDiabetesHospital();
    initNurseWoundCareHospital();
    await initChest();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init Doctor in the scene
  void initDoctorHospital() {
    doctorHospital = DoctorHospital(GameImageAssets.doctorHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init Assistant Nurse in the scene
  void initAsscHospital() {
    asscHospital = AsscHospital(GameImageAssets.asscHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init Diabetes Nurse in the scene
  void initNurseDiabetesHospital() {
    nurseDiabetesHospital =
        NurseDiabetesHospital(GameImageAssets.nurseDiabetesHospital)
          ..size = Vector2.all(GameParams.middleSize)
          ..anchor = Anchor.center;
  }

  /// Init Woundcare Nurse in the scene
  void initNurseWoundCareHospital() {
    nurseWoundCareHospital =
        NurseWoundCareHospital(GameImageAssets.nurseWoundCareHospital)
          ..size = Vector2.all(GameParams.middleSize)
          ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    doctorHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    asscHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    nurseDiabetesHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    nurseWoundCareHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  /// Init chests in the scene
  Future<void> initChest() async {
    final image = await Flame.images.load('gameObjects/bigChest.png');
    chest1 = ChestQuest(
        sprite: Sprite(image),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: 'Prevention',
        questMessage: QuestDialogsMission7.prevention,
        questType: '');
    chest2 = ChestQuest(
        sprite: Sprite(image),
        size: Vector2.all(32),
        anchor: Anchor.center,
        questName: 'Treatment',
        questMessage: QuestDialogsMission7.treatment,
        questType: '');
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (step1IsDone) {
      step1 = false;
      step1IsDone = false;
      step2 = true;
      canChangeScene = true;
    }

    // if (step2IsDone) {
    //   step2 = false;
    //   step2IsDone = false;
    //   step3 = true;
    // }

    if (step3IsDone) {
      step3 = false;
      step3IsDone = false;
      step4 = true;
    }

    if (step4IsDone) {
      step4 = false;
      step4IsDone = false;
      step5 = true;
    }

    if (step5IsDone) {
      step5 = false;
      step5IsDone = false;

      add(chest1);
      add(chest2);

      step6 = true;
    }

    // Done with all
    if ((chest1 as ChestQuest).isOpened &&
        (chest2 as ChestQuest).isOpened &&
        step6) {
      step6 = false;
      step6IsDone = false;
      isDone = true;
      canChangeScene = true;
    }
  }
}
