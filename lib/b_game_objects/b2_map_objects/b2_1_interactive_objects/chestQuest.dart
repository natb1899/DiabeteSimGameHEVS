import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../../d_game_scenes/game_scene_generator.dart';
import '../../b1_characters/player.dart';

/// This class defines what is a ChestQuest and which behavior it has
class ChestQuest extends SpriteComponent
    with CollisionCallbacks, HasGameRef<DiabeteGameScene> {
  String questName;
  String questMessage;
  String questType;
  bool isOpened = false;
  bool _hasCollided = false;

  ChestQuest({
    required Sprite sprite,
    required Vector2 size,
    required Anchor anchor,
    required this.questName,
    required this.questMessage,
    required this.questType,
  }) : super(
          sprite: sprite,
          size: size,
          anchor: anchor,
        );

  /// On loading the chestQuest, we add the collision shape
  @override
  Future<void>? onLoad() async {
    add(RectangleHitbox.relative(Vector2(0.9, 0.9),
        parentSize: Vector2(width, height))
      ..collisionType = CollisionType.passive
      ..isSolid = true);
  }

  /// When the player collide with the chestQuest, the chestQuest is removed from the scene and display a dialog concerning the quest.
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        gameRef.gameScenesController.gameDialogController.inputDialog.add(
          DialogModel(
            isShowDialog: true,
            dialogMessage: questMessage,
          ),
        );
        gameRef.remove(this);
        isOpened = true;

        _hasCollided = true;
      }
    }
  }
}
