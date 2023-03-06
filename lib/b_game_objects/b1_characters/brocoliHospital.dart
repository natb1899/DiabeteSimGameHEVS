import 'package:flame/components.dart';
import 'package:seriousgame/b_game_objects/b1_characters/player.dart';
import '../../d_game_scenes/d_2_hospital/game_scene_brocoliChamber.dart';
import '../../z_globals/z12_dialog_mission_4_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';

/// This class manager M. Brocoli. Brocoli inherits from perso (perso_base.dart)
class BrocoliHospital extends Perso
    with HasGameRef<DiabeteGameSceneBrocoliChamber> {
  BrocoliHospital(String user)
      : super(fileNamePngCharacter: GameImageAssets.brocoli);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.BroHopStep1) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission4Part1);
          gameRef.BroHopStep1IsDone = true;
        }
        if (gameRef.BroHopStep2) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission4Part2);
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
