import 'package:flame/components.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/map_object.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../../z_globals/z10_dialog_mission_1_manager.dart';
import '../../../z_globals/z1_game_manager.dart';
import '../../b1_characters/player.dart';

/// Fridge object
class Fridge extends MapObject {
  bool _hasCollided = false;

  Fridge({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.currentStep == 5) {
          // Go to fridge to choose aliment
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission1Part4);
          gameRef.currentStep = 6;
        } else {
          gameRef.gameScenesController.gameDialogController.inputDialog.add(
            DialogModel(
                isShowDialog: true,
                dialogMessage:
                    "Hummm, je prendrais bien une petite boisson en attendant Mr Moutarde !"),
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
      gameRef.player.collisionDirection = PlayerBehavior.noCollision;
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }
}
