import 'package:flame/components.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'package:seriousgame/b_game_objects/b1_characters/player.dart';

import '../../d_game_scenes/d_1_village_cms/game_scene_mission3.dart';
import '../../z_globals/z11_dialog_mission_3_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';

/// This class manager M. Brocoli. Brocoli inherits from perso (perso_base.dart)
class Brocoli extends Perso with HasGameRef<DiabeteGameSceneBrocoli> {
  Brocoli(String user) : super(fileNamePngCharacter: GameImageAssets.brocoli);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.etape1) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part1);
          gameRef.etape1IsDone = true;
        } else if (gameRef.etape2) {
          gameRef.gameScenesController.gameDialogController.onDialog(
              DialogModel(
                  isShowDialog: true, dialogMessage: "Je suis en colère"));
        } else if (gameRef.etape3) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part3);
          gameRef.etape3IsDone = true;
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
