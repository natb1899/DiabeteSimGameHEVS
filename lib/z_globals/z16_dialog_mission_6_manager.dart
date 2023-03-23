import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

//Dialog With Mme. Choux
final dialogsMission6part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Voici Mme. Choux. Elle doit jeûner en vue d'un examen investigatoire et a un diabète de type 2.\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmière: \n\n"
        "Bonjour, Mme. Choux. Comment allez vous?\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Mme. Choux: \n\n"
        "Bonjour, madame. Je vais bien, mais j'ai très faim.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 2,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 1, mission 6:",
    question:
        "L'infirmière junior a laisser un plat sur la table de Mme. Choux. Devez-vous l'autoriser à manger?",
    questions: [
      {
        "result": false,
        "answer": "Oui, elle a faim et doit manger.",
      },
      {
        "result": true,
        "answer": "Non, elle doit jeûner pour son examen.",
      },
    ],
    falseAswers:
        "C'est incorrect. La patiente doit jeûner pour que son examen soit fiable.",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers: "C'est correct. Malgré la faim, la patiente doit jeûner.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 3,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 2, mission 6:",
    question:
        "Son insuline basale est basse. D'après la prescription, elle doit prendre 5 unités d'insuline chaque matin. Devez-vous lui faire une injection?",
    questions: [
      {
        "result": false,
        "answer": "Oui, l'injection doit être faite.",
      },
      {
        "result": true,
        "answer":
            "Non, il ne faut pas l'injecter en raison de son prochain examen.",
      },
    ],
    falseAswers:
        "C'est incorrect. Le traitement à d'insuline basale doit être maintenu. En cas de doute, contactez le médecin traitant la veille de l'examen.",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: false,
    trueAswers:
        "Correct! Le traitement à d'insuline basale doit être maintenu. En cas de doute, contactez le médecin traitant la veille de l'examen.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 4,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 3, mission 6:",
    question:
        "Mme. Choux pourrait souffir d'hypoglycémie durant la journée, en particulier si son examen est retardé. Que faire si elle a des symptômes d'hypoglycémie?",
    questions: [
      {
        "result": false,
        "answer": "Lui donner des carrés de sucre.",
      },
      {
        "result": false,
        "answer":
            "Prendre sa glycémie et lui donner un jus de fruit si le taux de sucre est bas.",
      },
      {
        "result": true,
        "answer":
            "Prendre sa glycémie, lui donner une source de sucre approuvée par un médecin et reprendre sa glycémie dans 15 minutes.",
      },
    ],
    falseAswers: "Mauvaise réponse. Réessayez.",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers:
        "C'est correct! Vous saurez comment prendre soin de Mme. Choux.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Bravo! Vous avez terminé les soins pour Mme. Choux.\n"
        "Vous avez appris à prendre soin de patients diabétiques en jeûne.\n\n"
        "Rendez-vous au bureau des infirmière.\n",
    hasNext: true,
    index: 5,
  ),
];
