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
    dialogMessage: "Mari: \n\n"
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

final dialogsMission2part4 = DialogModel(
  isShowDialog: true,
  dialogMessage:
      "Bien joué! Dans cette situation, vous avez identifié les complications du diabète à long terme.\n"
      "Vous avez terminé le second niveau et pouvez maintenant vous rendre chez M. Brocoli!\n",
  index: 1,
);

class QuestDialogsMission2 {
  DialogModel neuropathy = DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionCheckbox,
    questionTitle: "Question 1, mission2:",
    question: "Quels sont les symptômes de la neuropathie diabétique ?",
    questions: [
      {
        "result": true,
        "answer": "Paresthesie",
      },
      {
        "result": true,
        "answer": "Faiblesse musculaire",
      },
      {
        "result": true,
        "answer": "Hyposensibilité",
      },
      {
        "result": true,
        "answer": "Douleurs nocturnes",
      },
      {
        "result": false,
        "answer": "Pieds froids",
      },
    ],
    falseAswers: "Vous n'avez pas trouvé tous les symptômes, retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false, ///////////////////////////////////////////////To change
    trueAswers:
        "Bravo!\n Vous avez trouvé tous les symptômes de la neuropathie!\n"
        "Parce que la neuropathie n'est pas un symptôme cardiovasculaire, la température des membres ne change pas.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    index: 0,
    hasNext: false,
  );

  DialogModel hyperglicemia = DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 2, mission2:",
    question:
        "L’hyperglycemie peut causer des microangiopathies qui peuvent entraîner des complications renales.",
    questions: [
      {
        "result": true,
        "answer": "Vrai",
      },
      {
        "result": false,
        "answer": "Faux",
      },
    ],
    falseAswers:
        "Mauvaise réponse!\n30 % des patients des programmes de dialyse souffrent de néphropathie diabétique. \n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n 30 % des patients des programmes de dialyse souffrent de néphropathie diabétique. \n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 1,
    hasNext: false,
  );

  DialogModel visual = DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 3, mission2:",
    question:
        "Il n'est pas necessaire de considerer les symptômes visuels parce que cela est normal à un âge avancé.",
    questions: [
      {
        "result": false,
        "answer": "Vrai",
      },
      {
        "result": true,
        "answer": "Faux",
      },
    ],
    falseAswers:
        "Mauvaise réponse!\n Entre 40 et 70% des patients atteints de diabète de type 2 développent un rétinopathie diabétique si ils ont été malade pendant plus de 20 ans. \n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n Entre 40 et 70% des patients atteints de diabète de type 2 développent un rétinopathie diabétique si ils ont été malade pendant plus de 20 ans.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 2,
    hasNext: false,
  );

  DialogModel cardiovascular = DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionCheckbox,
    questionTitle: "Question 4, mission2:",
    question:
        "Selectionnez ce qui impacte négativement les fonctions cardiovasculaires.",
    questions: [
      {
        "result": true,
        "answer": "Hyperglycémie",
      },
      {
        "result": false,
        "answer": "Vitamine C",
      },
      {
        "result": false,
        "answer": "HDL",
      },
      {
        "result": true,
        "answer": "LDL",
      },
    ],
    falseAswers:
        "Vous n'avez pas trouvé tous les facteurs de risque, retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry:
        false, ////////////////////////////////////////////////////////////To change
    trueAswers:
        "Bravo!\n Vous avez trouvé un élément qui influe négativemment sur le système cardiovasculaire.\n"
        "HDL est le 'bon cholestérol', donc il n'est pas un facteur de risque pour les maladies cardiovasculaires.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    index: 3,
    hasNext: false,
  );
}
