import 'package:flame/components.dart';
import 'package:seriousgame/z_globals/z10_dialog_mission_2_manager.dart';

import '../../d_game_scenes/d_1_village_cms/game_scene_mission2.dart';
import '../../z_globals/z10_dialog_mission_1_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager M. Moutarde. Moutarde inherits from perso (perso_base.dart)
class Myrtille extends Perso with HasGameRef<DiabeteGameSceneMyrtille> {
  Myrtille() : super(fileNamePngCharacter: GameImageAssets.myrtille);

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
              .onDialogList(dialogsMission2part1);
          gameRef.step1IsDone = true;
        } else if (gameRef.step2) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission2part2);
          gameRef.step2IsDone = true;
        } else if (gameRef.step4) {
          gameRef.gameScenesController.gameDialogController
              .onDialog(dialogsMission2part3);
          gameRef.step4IsDone = true;
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
