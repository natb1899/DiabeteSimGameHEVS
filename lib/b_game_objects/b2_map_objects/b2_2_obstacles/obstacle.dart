// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../map_object.dart';

/// This class define what is an Obstacle and which behavior has an obstacle
class Obstacle extends MapObject {
  Obstacle({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );
}
