// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../d_game_scenes/game_scene_generator.dart';
import '../../z_globals/z1_game_manager.dart';
import '../b1_characters/player.dart';

/// This abstract class describe the behavior of a standard object
/// that you can show on the map (house, tv, tree etc...)
abstract class MapObject extends PositionComponent
    with CollisionCallbacks, HasGameRef<DiabeteGameScene> {
  final bool isHavaingCollisionShapePolygone;
  List<Point>? polygonePoints;
  MapObject({
    required this.isHavaingCollisionShapePolygone,
    this.polygonePoints,
  });

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(getHitBox());
  }

  /// Get either the polygonHitbox or rectangleHitbox
  Component getHitBox() {
    if (isHavaingCollisionShapePolygone) {
      List<Vector2> polygoneVectors = polygonePoints
          ?.map((p) => Vector2(p.x, p.y))
          .toList() as List<Vector2>;

      return PolygonHitbox(polygoneVectors)
        ..collisionType = CollisionType.passive
        ..isSolid = true;
    }
    return RectangleHitbox.relative(Vector2(0.9, 0.9),
        parentSize: Vector2(width, height))
      ..collisionType = CollisionType.passive
      ..isSolid = true;
  }

  /// When the player starts the collision, set some parameters
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is PlayerComponent) {
      gameRef.player.collisionDirection =
          gameRef.player.playerMovementDirection;
      gameRef.player.setOnIdlePlayerDirection();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      gameRef.player.collisionDirection = PlayerBehavior.noCollision;
    }
    super.onCollisionEnd(other);
  }
}
