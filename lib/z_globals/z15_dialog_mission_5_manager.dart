import 'package:seriousgame/z_globals/z1_game_manager.dart';
import 'package:seriousgame/z_globals/z3_strings_manager.dart';

import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

//Dialog with M. Fraiseux
final dialogMission5part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "M. Fraiseux: \n\n"
        "Bonjour, on m'a dit que je présentais des facteurs de risque de diabète pendant ma dernière hospitalisation. Je serais apparemment en pré-diabète...\n"
        "J'ai encore du mal à savoir ce qui serait bon ou mauvais pour moi. Pouvez-vous m'aider ?\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmière: \n\n"
        "Avec plaisir! On va passer en revue des objets du quotidien pour vous aider à y voir plus clair.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Récupérez les objets dispersé dans la chambre pour aider M. Fraiseux à comprendre ce qui peut augmenter ou réduire son risque de contracter le diabète.\n",
    hasNext: false,
    index: 2,
  ),
];

//Objects text
class QuestDialogsMission5 {
  DialogModel milkChocolat = DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Le chocolat au lait est riche en gras et en sucres. Ce qui pourrait nuire à la situation de M. Fraiseux.\n"
        "Vous lui recommandez de réduire sa consommation de chocolat et aliments similaire au profit d'autres aliments plus sain.\n",
    hasNext: false,
    index: 0,
  );
  DialogModel sportsClubBrochure = DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous félicitez le patient pour son initiative de rejoindre un club sprotif.\n"
        "L'activité physique réduit le comportement sédentaire et prévient le développement du diabète de type 2.\n",
    hasNext: false,
    index: 0,
  );
  DialogModel cigarettes = DialogModel(
    isShowDialog: true,
    dialogMessage: "Fumez augmente le risque de développer du diabète.\n"
        "Avec le patient, vous fixez des objectifs SMART pour graduellement réduire sa consommation de tabac.\n"
        "De plus vous l'orientez vers des ressources matérielles et humaines pour l'aider à arrêter de fumer.\n",
    hasNext: false,
    index: 0,
  );
  DialogModel cellPhone = DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Le patient vous dit qu'internet est sa principale source d'information.\n"
        "Vous orientez le patient vers des sites internet fiables et crédibles, ce qui l'aidera à mieux gérer ses habitudes.\n",
    hasNext: false,
    index: 0,
  );
}

//End of Object quest, bag interaction
final dialogMission5part3 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous avez terminé l'instruction sur les facteurs de risque et de protection contre le diabète.\n"
        "M. Fraiseux est maintenant plus informé sur les habitudes à adopter pour prévenir le diabète.\n"
        "Vous gagnez 5 point sur la barre de qualité des soins! \n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 1,
    dialogType: DialogType.questionCheckbox,
    questionTitle: "Question 1, mission 5:",
    question:
        "M. Fraiseux va bientôt sortir de l'hôpital. Qui contacter pour organiser un suivi à domicile ?",
    questions: [
      {
        "result": false,
        "answer": "Les urgences",
      },
      {
        "result": true,
        "answer": "Son médecin traitant",
      },
      {
        "result": false,
        "answer": "Le bureau du CMS",
      },
      {
        "result": true,
        "answer": "La diététicienne",
      },
      {
        "result": true,
        "answer": "Le physiothérapeute en réadaptation cardiovasculaire",
      },
      {
        "result": true,
        "answer": "Le tabacologue",
      },
      {
        "result": false,
        "answer": "L'aumônier",
      }
    ],
    falseAswers: "Ce n'est pas la bonne réponse. Vous auriiez dû choisir:\n"
        "Son médecin traitant, La diététicienne, Le physiothérapeute en réadaptation cardiovasculaire et Le tabacologue",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Félicitations! Vous avez identifié tous les professionnels de santé qui peuvent aider M. Fraiseux.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous avez terminé le cinquième niveau et pouvez maitenant aller voir M.Choux. \n",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: GameDialogs.transmissionFraiseux,
    index: 3,
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.notes,
        GameCharacters.fraiseux,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at ligula sed libero varius tempor eget ut neque."
      ],
    ],
  ),
];
