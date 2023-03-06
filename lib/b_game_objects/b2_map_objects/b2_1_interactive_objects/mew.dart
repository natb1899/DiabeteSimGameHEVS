import 'package:flame/components.dart';
import 'package:seriousgame/b_game_objects/b2_map_objects/map_object.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../../z_globals/z10_dialog_mission_1_manager.dart';
import '../../../z_globals/z1_game_manager.dart';
import '../../b1_characters/player.dart';

/// Mew object
class Mew extends MapObject {
  bool _hasCollided = false;

  Mew({
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
        gameRef.gameScenesController.gameDialogController.onDialog(
          DialogModel(
            isShowDialog: true,
            dialogMessage: "Ho c'est le pokemon légendaire Mew, je vais le laisser tranquille, j'ai du travail",
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
      gameRef.player.collisionDirection = PlayerBehavior.noCollision;
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }
}
