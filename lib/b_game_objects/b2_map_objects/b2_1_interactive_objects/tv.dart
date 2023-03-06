// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';
import 'package:flame/components.dart';

import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import '../../b1_characters/player.dart';
import '../map_object.dart';

/// TV object
class TV extends MapObject {
  bool _hasCollided = false;
  bool _streamDialofFlag = true;
  TV({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  final dialogs = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Bonjour la haute ecole de sante du valais. Bienvenue a Bellevue 😇.\n"
          "Vous avez bien fait de venir et nous sommes heureux de vous acceuillir.\n\n"
          "Merci pour votre confiance 🌞.\n\n",
      hasNext: true,
      index: 0,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Nous sommes heureux de vous avoir presente notre premiere release.\n\n"
          "Notre Team a trouve son equilibre dans l'organisation suivante :\n\n",
      hasNext: true,
      index: 1,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "- L'excellent Remi Cohu : Notre Scrum Master 👮‍♂️.\n"
          "- Le Mituculeux Antony Marques : Notre DevOps 🕵️‍♂️.\n"
          "- La Creative Stephanie Beachler : Notre Experte en Tuiles 👩🏼‍💼.\n"
          "- L'Artiste Jonathan Kung : Notre Expert en Logiciel de Design 👨‍🎨.\n"
          "- Le Null Pointer Exception Nadir Zemrani : Notre Architecte 🧙‍♂️.\n\n"
          "Nous partageaons tous le role de devellopeuse 👩🏼‍💻 et devellopeur 👨🏼‍💻...\n\n",
      hasNext: true,
      index: 2,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Nous vous founrnissons dans cette release le 100% des fonctionnalites avec un petit plus.\n",
      hasNext: true,
      index: 3,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Il est temps de nous evaluer...",
      hasQuestion: true,
      hasNext: true,
      questionTitle: "Evaluation du Sprint 0 :",
      question: "Que pensez vous de notre travail ?",
      questions: [
        {
          "result": false,
          "answer": "1. C'est vraiment pas ce que nous attendions...",
        },
        {
          "result": false,
          "answer": "2. Bof...",
        },
        {
          "result": true,
          "answer": "3. Vendu 💰!",
        }
      ],
      index: 4,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Merci pour votre juste evaluation. Nous sommes a vous a present pour discuter plus en avant de la suite projet 🤖.",
      hasNext: false,
      index: 5,
    ),
  ];

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (_streamDialofFlag) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogs);
        }
        _streamDialofFlag = false;
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
      _streamDialofFlag = true;
    }
    super.onCollisionEnd(other);
  }
}
