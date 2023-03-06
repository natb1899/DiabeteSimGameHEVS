import 'package:flame/components.dart';

import '../../d_game_scenes/d_1_village_cms/game_scene_mission1.dart';
import '../../z_globals/z10_dialog_mission_1_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager M. Moutarde. Moutarde inherits from perso (perso_base.dart)
class Moutarde extends Perso with HasGameRef<DiabeteGameSceneMoutarde> {
  Moutarde() : super(fileNamePngCharacter: GameImageAssets.moutarde);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.step1) {
          // Choice 2 -> Letter PQRSTU
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission1Part1);
          gameRef.step1IsDone = true;
        } else if (gameRef.step2) {
          // Can found the 6 chests
          gameRef.gameScenesController.gameDialogController
              .onDialog(dialogsMission1Part2);
          gameRef.step2IsDone = true;
        } else if (gameRef.step4) {
          // 6 chests found, input questions for each letter
          // Choice 3 -> vitals signes (take 4 tools in bag)
          // Choice 1 -> check glycemy (take glycometer in bag)
          // Indicate to move to fridge
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission1Part3);
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
