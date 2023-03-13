import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../../d_game_scenes/game_scene_generator.dart';
import '../../b1_characters/player.dart';

/// This class defines what is a ChestQuest and which behavior it has
class ChestQuest extends SpriteComponent
    with CollisionCallbacks, HasGameRef<DiabeteGameScene> {
  String questName;
  dynamic questMessage;
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
        if (questType == "") {
          gameRef.gameScenesController.gameDialogController.inputDialog.add(
            DialogModel(
              isShowDialog: true,
              dialogMessage: questMessage,
            ),
          );
        } else {
          gameRef.gameScenesController.gameDialogController
              .onDialog(DialogModel(
            isShowDialog: true,
            dialogMessage: questMessage["questionTitle"],
            hasQuestion: true,
            dialogType: DialogType.questionRadioButton,
            questionTitle: "Question 1, mission 1:",
            question:
                "Le patient se plaint de céphalées. Parmi ces quatre interventions, laquelle est prioritaire ?",
            questions: [
              {
                "result": false,
                "answer": "Prendre une glycémie",
              },
              {
                "result": true,
                "answer": "Effectuer un PQRSTU et AMPLE",
              },
              {
                "result": false,
                "answer": "Prendre les signes vitaux",
              },
              {
                "result": false,
                "answer": "Conseiller au patient de manger une banane",
              }
            ],
            falseAswers: "Cette action n’est pas prioritaire, retentez !",
            falseAswersContent:
                "Vous perdez 1 point sur la barre de qualité des soins.",
            retry: true,
            trueAswers: "Félicitations !",
            trueAswersContent:
                "Vous gagnez 1 point sur la barre de qualité des soins !",
            falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
          ));
        }

        gameRef.remove(this);
        isOpened = true;

        _hasCollided = true;
      }
    }
  }
}
