import 'package:flame/components.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_mission3.dart';
import '../../d_game_scenes/d_2_hospital/game_scene_hospitalInterior.dart';
import '../../z_globals/z11_dialog_mission_3_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manage Guy01. Guy01 inherits from perso (perso_base.dart)
class Guy01 extends Perso with HasGameRef<DiabeteGameSceneHospitalInterior> {
  Guy01(String user)
      : super(fileNamePngCharacter: GameImageAssets.guy01);
  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
              isShowDialog: true,
              dialogMessage: "J'ai mal au pied",
            ),
          );
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }
}
