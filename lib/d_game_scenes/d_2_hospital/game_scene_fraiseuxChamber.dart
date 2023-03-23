import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:seriousgame/b_game_objects/b1_characters/brocoliHospital.dart';
import 'package:seriousgame/b_game_objects/b1_characters/fraiseux.dart';
import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../game_scene_generator.dart';

class DiabeteGameSceneFraiseuxChamber extends DiabeteGameScene {
  // Scene components list
  List<Component> sceneObjects = [];

  late Fraiseux fraiseux;

  //Scene steps
  bool etape1 = true;
  bool etape2 = false;
  bool etape3 = false;

  bool etape1IsDone = false;
  bool etape2IsDone = false;
  bool etape3IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneFraiseuxChamber({
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
    initFraiseux();
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

  //####################################

  @override
  void update(double dt) {
    super.update(dt);
    //steps
  }
}
