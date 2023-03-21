import 'package:flame/components.dart';
import 'package:seriousgame/d_game_scenes/d_1_village_cms/game_scene_mission2.dart';
import 'package:seriousgame/d_game_scenes/d_2_hospital/game_scene_nurseOffice.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../z_globals/z10_dialog_mission_2_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager Myrtille Husband. Myrtille Husband inherits from perso (perso_base.dart)
class DoctorHospital extends Perso
    with HasGameRef<DiabeteGameSceneNurseOffice> {
  DoctorHospital(String user)
      : super(fileNamePngCharacter: GameImageAssets.doctorHospital);
  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is PlayerComponent) {
      _hasCollided = false;
    }
  }
}
