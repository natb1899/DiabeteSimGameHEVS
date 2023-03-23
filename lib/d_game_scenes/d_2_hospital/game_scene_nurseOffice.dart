import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/apricotHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/asscHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/doctorHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseDiabetesHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/nurseWoundCareHospital.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/b2_1_interactive_objects/chestQuest.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_2_manager.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

/// Loader of the different scenes in the game
class DiabeteGameSceneNurseOffice extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late ApricotHospital apricotHospital;
  late DoctorHospital doctorHospital;
  late AsscHospital asscHospital;
  late NurseDiabetesHospital nurseDiabetesHospital;
  late NurseWoundCareHospital nurseWoundCareHospital;

  //brocoliscène
  bool BroHopStep1 = true;
  bool BroHopStep2 = false;

  bool BroHopStep1IsDone = false;
  bool BroHopStep2IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

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
    initApricot();
    initDoctor();
    initAssc();
    initNurseDiabetes();
    initNurseWoundCare();
    await initChest();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the apricot in the scene
  void initApricot() {
    apricotHospital = ApricotHospital(GameImageAssets.apricotHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init the Doctor in the scene
  void initDoctor() {
    doctorHospital = DoctorHospital(GameImageAssets.doctorHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init the ASSC in the scene
  void initAssc() {
    asscHospital = AsscHospital(GameImageAssets.asscHospital)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.center;
  }

  /// Init the nurse diabetes in the scene
  void initNurseDiabetes() {
    nurseDiabetesHospital =
        NurseDiabetesHospital(GameImageAssets.nurseDiabetesHospital)
          ..size = Vector2.all(GameParams.middleSize)
          ..anchor = Anchor.center;
  }

  /// Init the nurse wound care in the scene
  void initNurseWoundCare() {
    nurseWoundCareHospital =
        NurseWoundCareHospital(GameImageAssets.nurseWoundCareHospital)
          ..size = Vector2.all(GameParams.middleSize)
          ..anchor = Anchor.center;
  }

  void continueInitialisation() {
    apricotHospital
      ..debugMode = kDebugMode // Only true on debug mode (dev work)
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
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
  }

  //#####################################

  @override
  void update(double dt) {
    super.update(dt);

    //add(chest1);
    //add(chest2);

    if (BroHopStep1IsDone) {
      BroHopStep1 = false;
      BroHopStep2 = true;
      BroHopStep1IsDone = false;
      canChangeScene = true;
      isDone = true;
    }
    if (BroHopStep2IsDone) {
      BroHopStep2 = false;
      BroHopStep2IsDone = false;
    }
  }
}
