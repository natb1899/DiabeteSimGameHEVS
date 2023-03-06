import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

/// all dialogs for the situation 1
final dialogsMission1Part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmière: \n\n"
        "Bonjour Monsieur Moutarde, je m’appelle Margot, je suis infirmière au CMS. Comment allez-vous aujourd'hui ?\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Patient: \n\n"
        "Bonjour, je vais bien merci. Je me sens juste un peu fatigué et j’ai mal à la tête.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Le patient se plaint de céphalées. Parmi ces quatre interventions, laquelle est prioritaire ?",
      hasQuestion: true,
      index: 2,
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
      hasNext: true),
  DialogModel(
    index: 3,
    isShowDialog: true,
    hasNext: false,
    dialogMessage:
        "Vous avez identifié l’action prioritaire dans cette situation ! Le recueil de données est une intervention infirmière indispensable dans le processus de soin.",
  )
];

final dialogsMission1Part2 = DialogModel(
  isShowDialog: true,
  dialogMessage:
      "Vous allez maintenant parcourir la maison du patient pour récolter les lettres cachées dans les coffres. \n"
      "Elles vous permettront de réaliser le PQRSTU !",
);

final dialogsMission1Part3 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Félicitations ! Vous avez collecté toutes lettres. Vous allez maintenant les associer aux réponses du patient.",
    index: 0,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 1,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 2 mission 1:",
    question: "Phrase 1 :\n\n"
        "J’ai une douleur située à la tête mais principalement au niveau du front et des tempes. J’ai également une sensation de fourmillements située dans les mains.",
    questions: [
      {
        "answer": "r",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 2,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre R correspondant à la région.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 3,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 3 mission 1:",
    question: "Phrase 2 :\n\n"
        "Je n’ai jamais ressenti de tels symptômes, je me demande s’ils sont en lien avec mon diabète. Je suis content que vous soyez venue pour m’aider car je ne sais plus ce que je dois faire dans cette situation. J’ai pourtant réalisé mon injection d’insuline lente ce matin comme ces 5 derniers jours à l’hôpital.",
    questions: [
      {
        "answer": "u",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 4,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre U correspondant à « Understand » qui est l’interprétation de la maladie par le patient.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 5,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 4 mission 1:",
    question: "Phrase 3 :\n\n"
        "Je ne sais pas ce qui a pu provoquer ces symptômes. Je n’ai pas beaucoup mangé hier soir. De plus, je n’ai pas pour habitude de déjeuner. J’ai voulu prendre un Dafalgan pour les douleurs à la tête mais il a eu peu d’effet contrairement à d’habitude.",
    questions: [
      {
        "answer": "p",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 6,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre P correspondant à provoquer/pallier.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 7,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 5 mission 1:",
    question: "Phrase 4 :\n\n"
        "J’ai des vertiges et des maux de tête. Je me sens transpirant. Quand je me suis regardé dans le miroir, je me trouvais pâle.",
    questions: [
      {
        "answer": "s",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 8,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre S correspondant aux signes et symptômes.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 9,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 6 mission 1:",
    question: "Phrase 5 :\n\n"
        "Mes symptômes sont apparus ce matin à mon réveil et ils s’accentuent progressivement.",
    questions: [
      {
        "answer": "t",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 10,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre T faisant référence à la temporalité.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 11,
    dialogType: DialogType.questionInput,
    questionTitle: "Question 7 mission 1:",
    question: "Phrase 6 :\n\n"
        "Ma douleur à la tête est forte. Je la situe à 6/10. C’est comme si quelqu’un me comprimait la tête. Je ressens également comme une sensation de fatigue générale.",
    questions: [
      {
        "answer": "q",
      }
    ],
    falseAswers: "Ce n’est pas la bonne réponse. Retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    hasNext: true,
  ),
  DialogModel(
      index: 12,
      isShowDialog: true,
      dialogMessage:
          "Il s’agit effectivement de la lettre Q correspondant à la quantité/qualité des symptômes.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    index: 13,
    dialogMessage:
        "Félicitations ! Vous avez terminé votre recueil de données avec l’outil PQRSTU. Gardez à l’esprit que pour réaliser un recueil de données pertinent, vous devez le compléter à l’aide de l’outil AMPLE.",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: GameDialogs.transmissionMoutarde,
    index: 14,
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.notes,
        GameCharacters.moutarde,
        "Patiente se plaint de céphalée non soulagée par la prise de Dafalgan. \n"
            "Céphalée évaluée à 6/10, décrit comme une compression au niveau de la tête, localisée au niveau du front et des tempes avec présence de fourmillement au niveau des mains.\n"
            "Patient présente également des vertiges, une sudation et une sensation de fatigue générale. Céphalée apparue progressivement ce matin au réveil."
      ]
    ],
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    index: 15,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 8, mission 1:",
    question: "Que faites-vous à présent ?",
    questions: [
      {
        "result": false,
        "answer": "Prendre une glycémie",
      },
      {
        "result": false,
        "answer": "Effectuer un PQRSTU et AMPLE",
      },
      {
        "result": true,
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
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    index: 16,
    dialogMessage:
        "Vous avez identifié l’action prioritaire dans cette situation ! La prise des signes vitaux est la deuxième action prioritaire car elle permet d’objectiver les symptômes du patient.",
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    index: 17,
    dialogMessage:
        "Maintenant, sélectionnez dans votre sac à dos, les quatre outils vous permettant de réaliser la prise des signes vitaux.",
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.tools,
        "Thermomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Thermomètre : \n\ntempérature = 36.3oC.",
              hasNext: true,
              index: 0)
        ],
        0,
        dialogsMission1Part3Next
      ],
      [
        GameInteractionTypes.tools,
        "Pulsoxymètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Pulsoxymètre : \n\nFC= 80 bpm, FR = 24/min, sat = 98%.",
              hasNext: true,
              index: 0)
        ],
        1,
        dialogsMission1Part3Next
      ],
      [
        GameInteractionTypes.tools,
        "Tensiomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Tensiomètre : \n\nTA = 115/50 mmHg.",
              hasNext: true,
              index: 0)
        ],
        2,
        dialogsMission1Part3Next
      ],
      [
        GameInteractionTypes.tools,
        "Stethoscope",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Stethoscope : \n\nTA = 115/50 mmHg.",
              hasNext: true,
              index: 0)
        ],
        3,
        dialogsMission1Part3Next
      ],
    ],
  )
];

final dialogsMission1Part3Next = <DialogModel>[
  DialogModel(
    index: 1,
    isShowDialog: true,
    dialogMessage:
        "FC= 80 pbm, TA= 115/50 mmHg, T = 36.3oC, sat = 98%, FR 24/min.\n"
        "Au vu des résultats de l’examen clinique, que faites-vous ?",
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 9, mission 1:",
    question: "FC= 80 pbm, TA= 115/50 mmHg, T = 36.3oC, sat = 98%, FR 24/min.\n"
        "Au vu des résultats de l’examen clinique, que faites-vous ?",
    questions: [
      {
        "result": true,
        "answer": "Prendre une glycémie",
      },
      {
        "result": false,
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
    hasNext: true,
  ),
  DialogModel(
      isShowDialog: true,
      index: 2,
      dialogMessage:
          "D’après votre recueil de données et la valeur des signes vitaux, vous décidez de mesurer la glycémie du patient.",
      hasNext: true),
  DialogModel(
    isShowDialog: true,
    index: 3,
    dialogMessage:
        "Sélectionnez dans votre sac à dos l’outil vous permettant de mesurer la glycémie.",
    hasInteraction: true,
    hasNext: false,
    dialogInteractions: [
      [
        GameInteractionTypes.tools,
        "Glycomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage: "Vous utilisez le Glycomètre : \n\n3.1 mmol/L.",
              hasNext: true,
              index: 0)
        ],
        0,
        dialogsMission1Part3NextSecond
      ],
    ],
  ),
];

final dialogsMission1Part3NextSecond = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    dialogMessage: "",
    questionTitle: "Question 10, mission 1:",
    question: "Glycomètre : 3.1 mmol/L.\n"
        "La valeur de la glycémie de Monsieur Moutarde est-elle dans la norme ?",
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
    falseAswers: "Ce n’est pas la bonne réponse.",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    trueAswers: "Félicitations !",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    index: 1,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "La norme de la valeur de la glycémie à jeun se situe entre 3.5 et 5.6   mmol/L.\n"
        "En tant qu’infirmière, il est indispensable de connaître la norme de la valeur de la glycémie à jeun et postprandial car l’hypo- ou l’hyperglycémie peuvent entraîner des répercussions graves sur l’état de santé des patients.",
    index: 2,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous avez identifié un état hypoglycémique chez Monsieur Moutarde. Dirigez-vous vers le frigo et trouvez un aliment permettant au patient d’équilibrer sa glycémie.",
    index: 3,
    hasNext: false,
  ),
];

final dialogsMission1Part4 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    questionTitle: "Question 11, mission 1:",
    question: "Voici le contenu du frigo. Quel aliment désirez-vous prendre ?",
    questions: [
      {
        "result": true,
        "answer": "Chocolat",
      },
      {
        "result": false,
        "answer": "Carotte",
      },
      {
        "result": true,
        "answer": "Jus d'orange",
      },
      {
        "result": false,
        "answer": "Bouteille d'eau",
      },
      {
        "result": false,
        "answer": "Viande",
      },
    ],
    falseAswers:
        "Il ne s’agit pas d’un aliment indiqué lors d’une hypoglycémie, retentez !",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers:
        "Vous avez sélectionné un aliment dont l’indice glycémique est élevé.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins !",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse.",
    index: 0,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Bravo ! Vous arrivez au terme de la prise en charge de Monsieur Moutarde.",
    index: 1,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Dans cette situation vous avez acquis les compétences suivantes :\n"
        "- Réalisation d’un recueil de données structuré\n"
        "- Evaluation de l’état de santé d’un patient en priorisant les interventions infirmière\n"
        "- Identification des signes et symptômes de l’hypoglycémie.",
    index: 2,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous pouvez sortir de la maison de Monsieur Moutard et poursuivre votre matinée !",
    index: 3,
    hasNext: true,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: GameDialogs.transmissionMoutarde,
    index: 4,
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.notes,
        GameCharacters.moutarde,
        "Paramètres vitaux : TA = 115/50 mmHg, FC= 80 bpm, FR = 24/min, sat = 98%, température = 36.3C. La glycémie est à 3.1 mmol/L."
      ],
      [
        GameInteractionTypes.notes,
        GameCharacters.moutarde,
        "Patient en hypoglycémie donné aliment sucré (chocolat, jus d’orange)."
      ]
    ],
  ),
];

class QuestDialogsMission1 {
  static String letterP = getDialog('P');
  static String letterQ = getDialog('Q');
  static String letterR = getDialog('R');
  static String letterS = getDialog('S');
  static String letterT = getDialog('T');
  static String letterU = getDialog('U');

  static String getDialog(String letter) {
    return 'Bravo ! Vous avez trouvé la lettre $letter.';
  }
}
