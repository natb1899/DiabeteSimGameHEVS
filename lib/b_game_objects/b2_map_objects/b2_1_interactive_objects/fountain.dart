// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import 'package:flame/components.dart';

import '../../b1_characters/player.dart';
import '../map_object.dart';

/// Fountain object
class Fountain extends MapObject {
  bool _hasCollided = false;
  Fountain({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  /// Nothing more than a collision happens when the player touches the fountain
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        // gameRef.player.dialogController.inputDialog.add(
        //     DialogModel(isShowDialog: true, dialogMessage: collisionMessage));
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
