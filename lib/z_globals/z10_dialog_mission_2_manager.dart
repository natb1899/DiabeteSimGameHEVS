import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

/// all dialogs for the situation 1
final dialogsMission2part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Infirmière: \n\n"
        "Hello Mme. Myrtille, je m'appelle Marie, je suis infirmière au CMS. Comment allez-vous aujourd'hui ?\n",
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Patient: \n\n"
        "...\n",
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: false,
    dialogMessage:
        "Mme. Myrtille est en colère, elle estime ne pas avoir besoin des services du CMS.\n"
        "D'après elle, votre présence est inutile et elle ne veut pas vous parler.\n",
    index: 2,
  ),
];

final dialogsMission2part2 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Infirmière: \n\n"
        "Hello Mme. Myrtille, je m'appelle Marie, je suis infirmière au CMS. Vous êtes le mari de Mme. Myrtille, n'est-ce pas?\n",
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Mari: \n\n"
        "Bonjour. Oui, je suis son époux.\n",
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Infirmière: \n\n"
        "Pouvez-vous me parler de votre femme?\n",
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: true,
    dialogMessage: "Infirmière: \n\n"
        "Ma femme a eu des problèmes avec son hygiène depuis quelques mois.\n"
        "Elle ne sens plus ses pieds et se plain de troubes visuels.\n"
        "Mais j'aime m'occuper d'elle et j'ai le soutien de mes enfants.\n",
    index: 3,
  ),
  DialogModel(
    isShowDialog: true,
    hasNext: false,
    dialogMessage:
        "Les problèmes décrit par le mari de la patiente semblent liés à des complications à long terme du diabète.\n"
        "Cherchez les coffres dans la maison pour répondre à des questions sur les complications du diabète.\n",
    index: 4,
  ),
];

final dialogsMission2part3 = DialogModel(
  isShowDialog: true,
  dialogMessage:
      "Bien joué! Dans cette situation, vous avez identifié les complications du diabète à long terme\n"
      "Vous pouvez maintenant vous rendre chez M. Moutarde.\n",
  index: 1,
);
