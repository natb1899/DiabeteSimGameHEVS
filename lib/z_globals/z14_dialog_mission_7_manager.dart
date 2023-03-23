import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

//Dialog with doctor
final dialogsMission7part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Docteur: \n\n"
        "Bonjour, je viens de dire à M. Abricot qu'il est atteint de diabète de type 2. Il est très inquiet et voudrait commencer son éducation thérapeutique aujourd'hui.\n"
        "Le patient souffre également d'une blessure à la cheville depuis 11 jours et présente des signes d'infection.\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmère: \n\n"
        "Bonjour, merci. J'irai le voir pour lui parler de sa thérapie.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Allez voir M. Abricot dans sa chambre.\n",
    hasNext: true,
    index: 2,
  ),
];

//Dialog with patient
final dialogsMission7part2 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "M. Abricot: \n\n"
        "Bonjour infirmière, je me fais du soucis. J'aurais quelques questions pour vous.\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 1, mission 7:",
    question: "Comment expliquer sa condition au patient ?\n",
    questions: [
      {
        "result": false,
        "answer": "C'est une maladie aïgue.",
      },
      {
        "result": true,
        "answer": "C'est une maladie chronique.",
      },
    ],
    falseAswers: "C'est incorrect, le diabète est une maladie chronique.\n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n C'est correct, le diabète est une maladie chronique.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 1,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 2, mission 7:",
    question:
        "La maladie est-elle causée par un manque d'insuline ou de glucagon ?\n",
    questions: [
      {
        "result": true,
        "answer": "Insuline",
      },
      {
        "result": false,
        "answer": "Glucagon",
      },
    ],
    falseAswers:
        "C'est incorrect, le diabète est charactérisé par un manque d'insuline.\n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n C'est correct, le diabète est charactérisé par un manque d'insuline.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 2,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 3, mission 7:",
    question:
        "La diabète vient-il d'un disfonctionnement du foie ou du pancréas ?\n",
    questions: [
      {
        "result": true,
        "answer": "pancréas",
      },
      {
        "result": false,
        "answer": "foie",
      },
    ],
    falseAswers:
        "C'est incorrect, le diabète est charactérisé par un pancréas disfonctionnel.\n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n C'est correct, le diabète est charactérisé par un pancréas disfonctionnel.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 3,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 4, mission 7:",
    question: "Le diabète peut-il être guérit ?\n",
    questions: [
      {
        "result": false,
        "answer": "oui",
      },
      {
        "result": true,
        "answer": "non",
      },
    ],
    falseAswers:
        "C'est incorrect, le diabète est une maladie irréversible. Il n'y a pas de remède.\n",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Bravo!\n C'est correct, le diabète est une maladie irréversible. Il n'y a pas de remède.\n",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 4,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Vous avez expliqué sa situation à M. Abricot.\n"
        "Vous pouvez retourner au bureau des infirmières. En tant qu'infirmière de référence, vous pourrez déléguer des soins à vos collègues.\n",
    hasNext: false,
    index: 5,
  ),
];

//Dialog with the Apprentice nurse
final dialogsMission7part3 = DialogModel(
  isShowDialog: true,
  hasQuestion: true,
  dialogType: DialogType.questionCheckbox,
  questionTitle: "Question 5, mission 7:",
  question:
      "Quelles tâches pouvez-vous déléguer à l'infirmière en formation ?\n",
  questions: [
    {
      "result": false,
      "answer": "Administrer des antibiotiques par intraveineuse",
    },
    {
      "result": true,
      "answer": "Tester le taux de glycémie",
    },
    {
      "result": true,
      "answer": "Soigner les plaies",
    },
  ],
  falseAswers: "Ce n'est pas correct, retentez !",
  falseAswersContent: "Vous perdez 1 point sur la barre de qualité des soins.",
  retry: true,
  trueAswers:
      "Bravo!\n En effet, une infirmière en formation ne peut pas préparer ou administer des soins par Intraveineuse.\n",
  trueAswersContent: "Vous gagnez 1 point sur la barre de qualité des soins !",
  falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
  index: 0,
  hasNext: false,
);

//Dialog with the diabetes specialist nurse
final dialogsMission7part4 = DialogModel(
  isShowDialog: true,
  hasQuestion: true,
  dialogType: DialogType.questionRadioButton,
  questionTitle: "Question 6, mission 7:",
  question:
      "C'est l'infirmière spécialisée dans le diabète, elle a encore 1h de libre.\n"
      "Lui demanderiez-vous d'aller voir M. Abricot pour commencer l'éducation thérapeutique sur son diabète?\n",
  questions: [
    {
      "result": true,
      "answer": "oui",
    },
    {
      "result": false,
      "answer": "non",
    },
  ],
  falseAswers:
      "C'est incorrect, votre collègue est habiletée à éduquer les patients diabétiques. Vous devriez lui déléguer cette tâche.\n",
  falseAswersContent: "Vous perdez 1 point sur la barre de qualité des soins.",
  retry: false,
  trueAswers:
      "Bravo!\n C'est correct, en tant que spécialiste, votre collègue sera la plus à même d'éduquer le patient.\n",
  trueAswersContent: "Vous gagnez 1 point sur la barre de qualité des soins !",
  index: 0,
  hasNext: true,
);

//Dialog with the wound specialist nurse
final dialogsMission7part5 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "C'est l'infirmière spécialisée dans les blessures. Elle vous explique que la blessure se soignera lentement parce que l'hyperglycémie chronique ralenti la guérison.\n"
        "Elle vous donne de nouvelles directives quant au soin de la blessure de M. Abricot que vous partagez avec vos collègues à l'écrit et à l'oral.\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Bravo!\n\n"
        "Vous avez pris en charge M. Abricot. Vous avez appris à collaborer au sein d'une équipe interdisciplinaire et avez démontré vos compétences en tant que référente.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous avez terminé votre matinée. Allez collecter les coffres dispersés dans la salle. Ils contiennent des informations que vous pourrez retrouver dans votre sac à dos.\n",
    hasNext: true,
    index: 2,
  ),
];

//Chest text
class QuestDialogsMission7 {
  DialogModel prevention = DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Le dépistage du prédiabète se fait à partir de 45 ans chez les patients en surpoids avec au moins un facteur de risque.\n",
    hasNext: false,
    index: 0,
  );
  DialogModel traitement = DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Le traitement non pharmacologique du diabète de type II consiste en une modification du mode de vie : alimentation, exercice physique, acquisition de compétences en matière d'auto-soins.\n",
    hasNext: false,
    index: 0,
  );
}

//End of level dialog
final endOfLevelDialogMission7 = DialogModel(
  isShowDialog: true,
  dialogMessage: "Bravo!\n\n"
      "Vous avez collecté les 2 coffres. Vous obtenez 1 points sur la barre de qualité des soins !\n"
      "Il est essentiel de rester à jour quant aux connaissances et aux compétences en matière de soins infirmiers. Vous pouvez retrourner chez vous pour vous reposer.\n",
  hasNext: false,
  index: 0,
);
