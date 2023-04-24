import 'package:flame/components.dart';

import '../../d_game_scenes/d_2_hospital/game_scene_chouxChamber.dart';
import '../../z_globals/z16_dialog_mission_6_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

class Choux extends Perso with HasGameRef<DiabeteGameSceneChouxChamber> {
  Choux() : super(fileNamePngCharacter: GameImageAssets.choux);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.step1) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission6part1);
          gameRef.step1IsDone = true;
        }
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
