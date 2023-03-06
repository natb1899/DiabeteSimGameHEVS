import 'package:flame/components.dart';

import '../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_mission3.dart';
import '../../z_globals/z11_dialog_mission_3_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager Brocoli Son. Brocoli Son inherits from perso (perso_base.dart)
class BrocoliSon extends Perso with HasGameRef<DiabeteGameSceneBrocoli> {
  BrocoliSon(String user)
      : super(fileNamePngCharacter: GameImageAssets.brocoliSon);
  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.etape1) {
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
              isShowDialog: true,
              dialogMessage: "Bonjour je suis le fils",
            ),
          );
        } else if (gameRef.etape2) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part2);

          gameRef.etape2IsDone = true;
        } else if (gameRef.etape3) {
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
              isShowDialog: true,
              dialogMessage: "Aidez mon père svp !",
            ),
          );
        }
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
