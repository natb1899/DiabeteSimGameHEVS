import 'package:flame/components.dart';
import 'package:seriousgame/z_globals/z3_strings_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../b1_characters/player.dart';
import '../map_object.dart';

/// Object concerning the changing scene point defined on Tiled
class ChangeScenePoint extends MapObject {
  bool _hasCollided = false;
  String toScene;
  GameScenesController gameScenesController;

  ChangeScenePoint({
    required this.toScene,
    required bool isHavaingCollisionShapePolygone,
    required this.gameScenesController,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  /// Loading the next scene when the playing starts the collision
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.canChangeScene) {
          loadNextScene();
        } else {
          // Display dialog that the player can't leave scene
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
                isShowDialog: true, dialogMessage: GameDialogs.cantLeaveScene),
          );
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

  /// Stop the old scene and load the new one
  void loadNextScene() {
    gameRef.stopScene();
    gameScenesController.goToScene(toScene);
  }
}
