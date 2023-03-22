import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

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
    dialogMessage: "\n",
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
final dialogsMission5part3 = <DialogModel>{
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous avez terminé l'instruction sur les facteurs de risque et de protection contre le diabète.\n"
        "M. Fraiseux est maintenant plus informé sur les habitudes à adopter pour prévenir le diabète.\n"
        "Vous gagnez 5 point sur la barre de qualité des soins! \n",
    hasNext: true,
    index: 0,
  ),
  /*DialogModel(
    isShowDialog: true,
    index: 3,
    dialogMessage:
        "Vous devez maintenant organiser la départ de M. Fraiseux. Ouvrez votre agenda et selectionnez la personne appropriée pour assurer la continuité des soins à domicile.\n",
    hasInteraction: true,
    hasNext: false,
    dialogInteractions: [
      [
        GameInteractionTypes.contacts,
        "Médecin traitant",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage: "Vous utilisez le Glycomètre : \n\n3.1 mmol/L.",
              hasNext: true,
              index: 0)
        ],
      ],
    ],
  ),*/
};
