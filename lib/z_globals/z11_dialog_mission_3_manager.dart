import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

/// all dialogs for the situation 3
final dialogsMission3Part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmière: \n\n"
        "Bonjour, c’est Margot, l’infirmière du CMS, comment allez-vous ?\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Patient: \n\n"
        "Sortez de chez moi, étrangère !\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous constatez que le patient est confus et agressif. Il ne souhaite pas communiquer avec vous ce matin. \n"
        "Peut-être que son fils pourrait vous aider... \n",
    hasNext: false,
    index: 2,
  ),
];
final dialogsMission3Part2 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Fils: \n\n"
        "Bonjour, je suis le fils de Monsieur Brocoli.\n"
        "Je suis inquiet pour mon papa, je ne l’ai jamais vu dans cet état. \n"
        "Cela fait plusieurs jours qu’il est confus. \n"
        "Hier matin, il ne savait plus où il se trouvait. Il se plaint parfois de douleurs au ventre. Il tousse également depuis quelques jours et se fatigue très vite lors des efforts. \n"
        "Cependant, je suis ravi de constater que depuis une semaine il a un meilleur appétit et qu’il s’hydrate davantage. \n"
        "Par contre, je suis inquiet, car il se rend très souvent aux toilettes, comme il est très affaibli je crains qu’il tombe.\n"
        "De plus, depuis environ deux semaines, je constate que certains médicaments que vous mettez dans le semainier se retrouvent dans la poubelle de la cuisine \n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
      isShowDialog: true,
      dialogMessage: GameDialogs.transmissionBrocoli,
      hasInteraction: true,
      dialogInteractions: [
        [
          GameInteractionTypes.notes,
          GameCharacters.brocoli,
          "Patient confus, agressif, n’accepte pas ma présence et refuse de communiquer ce matin. \n"
              "Je m’adresse à son fils qui est présent. Il est inquiet de l’état de son papa. \n"
              "Il le trouve confus depuis quelques jours, avec des douleurs abdominales, présence de toux et fatigue à l’effort. \n"
              "Depuis une semaine, il a plus d’appétit et s’hydrate davantage. \n"
              "Concernant le traitement, son fils a trouvé des médicaments dans la poubelle."
        ]
      ],
      hasNext: true,
      index: 1),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "D’après le récit du fils du patient, quels sont les signes ou symptômes qui vous indiquent une probable décompensation du diabète de Monsieur Brocoli ? \n",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionCheckbox,
    dialogMessage:
        "D’après le récit du fils du patient, quels sont les signes ou symptômes qui vous indiquent une probable décompensation du diabète de Monsieur Brocoli ? \n",
    hasNext: true,
    questionTitle: "Question 1, mission 3:",
    question:
        "quels sont les signes ou symptômes qui vous indiquent une probable décompensation du diabète de Monsieur Brocoli ?",
    questions: [
      {
        "result": true,
        "answer": "Alimentation excessive",
      },
      {
        "result": false,
        "answer": "Toux",
      },
      {
        "result": true,
        "answer": "Hydratation excessive",
      },
      {
        "result": false,
        "answer": "Dyspnée à l’effort",
      },
      {
        "result": true,
        "answer": "Urines fréquentes",
      }
    ],
    index: 3,
    falseAswers: "La réponse est incorrecte, retentez ! ",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins.",
    retry: true,
    trueAswers: "Félicitations ! Il s’agit de la bonne réponse.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins.\n"
        "Parmi les symptômes évoqués par le fils du patient, trois symptômes représentent les symptômes cardinaux de l’hyperglycémie : la polyphagie, la polyurie et la polydipsie.\n",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse \n",
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    dialogMessage:
        "Dans cette situation, est-il nécessaire de poursuivre l’examen clinique ?\n",
    hasNext: false,
    questionTitle: "Question 2, mission 3:",
    question:
        "Dans cette situation, est-il nécessaire de poursuivre l’examen clinique ?",
    questions: [
      {
        "result": true,
        "answer": "Oui",
      },
      {
        "result": false,
        "answer": "Non",
      }
    ],
    index: 4,
    retry: false,
    falseAswers: "La réponse n’est pas correcte.",
    falseAswersContent:
        "D’après le récit du fils du patient, vous suspectez un état hyperglycémique pouvant entraîner des répercussions graves sur l’état de santé du patient.\n"
        "Vous devez poursuivre l’examen clinique afin de mesurer le degré d’urgence de la situation. \n\n"
        "Vous perdez 1 point  sur la barre de qualité des soins. \n",
    trueAswers: "Bonne réponse !",
    trueAswersContent:
        "D’après le récit du fils du patient, vous suspectez un état hyperglycémique pouvant entraîner des répercussions graves sur l’état de santé du patient.\n"
        "Vous devez poursuivre l’examen clinique afin de mesurer le degré d’urgence de la situation \n\n"
        "Vous gagnez 1 point sur la barre de qualité des soins. \n",
  ),
];

final dialogsMission3Part3 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Ouvrez le sac et effectuer un examen clinique\n",
    hasNext: false,
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.tools,
        "Glycomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Glycomètre : \n\nLa glycémie est à 40 mmol/L.",
              hasNext: true,
              index: 0)
        ],
        0,
        dialogsMission3Part4,
      ],
      [
        GameInteractionTypes.tools,
        "Thermomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Thermomètre : \n\ntempérature = 37.5oC.",
              hasNext: true,
              index: 0)
        ],
        1,
        dialogsMission3Part4
      ],
      [
        GameInteractionTypes.tools,
        "Pulsoxymètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Pulsoxymètre : \n\nFC= 98 bpm, FR = 22/min, sat = 90%.",
              hasNext: true,
              index: 0)
        ],
        2,
        dialogsMission3Part4
      ],
      [
        GameInteractionTypes.tools,
        "Tensiomètre",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Tensiomètre : \n\nTA = 100/60 mmHg.",
              hasNext: true,
              index: 0)
        ],
        3,
        dialogsMission3Part4
      ],
      [
        GameInteractionTypes.tools,
        "Stethoscope",
        [
          true,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Vous utilisez le Stethoscope : \n\nTA = 100/60 mmHg.",
              hasNext: true,
              index: 0)
        ],
        4,
        dialogsMission3Part4
      ],
    ],
    index: 0,
  )
];

final dialogsMission3Part4 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    dialogMessage:
        "Au vu des résultats de l’examen clinique, que faites-vous ?",
    hasNext: true,
    questionTitle: "Question 3, mission 3:",
    question:
        "L’examen clinique révèle que le patient somnole mais qu’il est réveillable lors de la stimulation verbale.\n"
        "Il n’est orienté ni dans le temps ni dans l’espace. \n"
        "Cependant, il sait que vous êtes infirmière au CMS et que son fils est présent dans la salle. \n\n"
        "Ses paramètres vitaux sont les suivants :\n"
        "TA = 100/60 mmHg, FC= 98 bpm, FR = 22/min, sat = 90%, température = 37.5oC. La glycémie est à 40 mmol/L. \n"
        "Au vu des résultats de l’examen clinique, que faites-vous ? ",
    questions: [
      {
        "result": true,
        "answer": "Appel au médecin traitant",
      },
      {
        "result": false,
        "answer": "Ouverture du sac à dos et injection de 10 UI d’insuline",
      },
      {
        "result": false,
        "answer": "Ce n’est pas urgent, aucune intervention nécessaire ",
      }
    ],
    index: 1,
    retry: true,
    falseAswers: "Ce n’est pas la bonne réponse.\n",
    falseAswersContent:
        " Vous perdez 1 point sur la barre de qualité des soins. Retentez ! \n",
    trueAswers: "C’est la bonne réponse ! ",
    trueAswersContent:
        "Il s’agit d’une urgence, le patient risque un coma hyperosmolaire. \n"
        "Vous ne pouvez effectivement pas injecter les 10 UI d’insuline car vous n’avez pas de prescription médicale. \n"
        "Vous gagnez 1 point sur la barre de qualité des soins.\n",
    falseAswersContentbutnoLose: "Retentez ! ",
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Devant le tableau clinique, le médecin traitant vous demande d’appeler les urgences afin d’hospitaliser le patient \n",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Ouvrez votre sac à dos et rendez-vous dans l’onglet présentant les professionnels de la santé et sélectionnez l’icône correspondant aux urgences. \n",
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.contacts,
        "Urgences médicales",
        true,
        dialogsMission3Part5
      ],
    ],
    hasNext: false,
    index: 3,
  )
];
final List<DialogModel> dialogsMission3Part5 = [
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Une personne responsable de la centrale téléphonique des urgences vous répond.\n"
        "Quel outil de communication allez-vous utiliser pour effectuer des transmissions pertinentes et structurées ?.\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    dialogMessage:
        "Une personne responsable de la centrale téléphonique des urgences vous répond.\n"
        "Quel outil de communication allez-vous utiliser pour effectuer des transmissions pertinentes et structurées ?.\n",
    questionTitle: "Question 4 Situation 3",
    question:
        "Quel outil de communication allez-vous utiliser pour effectuer des transmissions pertinentes et structurées ?",
    questions: [
      {
        "result": false,
        "answer": "EVA",
      },
      {
        "result": true,
        "answer": "SBAR",
      },
      {
        "result": false,
        "answer": "ABCDE",
      }
    ],
    hasNext: true,
    index: 1,
    falseAswers: "Non, ce n’est pas le bon outil.",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins. Retentez !",
    retry: true,
    trueAswers: "Bravo !",
    trueAswersContent:
        "Vous avez sélectionné le bon outil. Vous gagnez 1 point sur la barre de qualité des soins \n",
    falseAswersContentbutnoLose: "Retentez !",
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Maintenant vous allez devoir choisir quel est le bon SBAR parmi 3 propositions. \n"
        "Soyez concentré car chaque proposition ne sera affichée qu’une seule fois \n ",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR1 \n\n"
        "Bonjour, je suis infirmière. J’ai besoin d’une ambulance de toute urgence. \n"
        "Mon patient va très mal. Il somnole, ses paramètres vitaux sont anormaux ! Il n’est pas orienté dans tous les modes ! \n"
        "Je sais qu’il est connu pour un diabète de type II. Son fils me dit que son état se péjore depuis quelque jour. \n"
        "Je suis très inquiète ! Venez vite !  \n ",
    hasNext: true,
    index: 3,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR2 \n\n"
        "Bonjour, je suis infirmière au CMS. Je vous appelle au sujet de Monsieur Brocoli, âgé de 84 ans, connu pour un diabète de type 2 traité uniquement par ADO. \n"
        "Selon son fils, il présente une baisse de l’état général depuis une semaine ainsi qu’une polyurie, une polyphagie et une polydipsie. \n"
        "Actuellement,  il est somnolent, mais réveillable lors de la stimulation verbale. Il est désorienté dans le temps et l’espace. \n"
        "Il a une température à 37.5oC, un FC à 98 bpm, une TA à 100/60 mmHg , une FR à 22/min, une sat à 90% et une glycémie à 40 mmol/L. \n"
        "Le patient est dans un état hyperglycémique avancé. Je crains que son état se péjore et qu’il fasse un coma hyperosmolaire.  \n"
        "Pouvez-vous envoyer une ambulance à l’adresse suivante : Chemin du Brocoli 3 ?\n",
    hasNext: true,
    index: 4,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR3 \n\n"
        "Bonjour, je suis infirmière au CMS. Je vous appelle au sujet de Monsieur Brocoli, âgé de 84 ans, connu pour un diabète de type 2. \n"
        "Actuellement,  le patient est somnolent, mais réveillable lors de la stimulation verbale. Il est désorienté dans le temps et l’espace. \n"
        " Il a une température à 37.5oC, un FC à 98 bpm, une TA à 100/60 mmHg , une FR à 22/min, une sat à 90% et une glycémie à 40 mmol/L. \n"
        "Le patient est dans un état hyperglycémique avancé. \n"
        "Je crains que son état se péjore et qu’il fasse un coma hyperosmolaire. Pouvez-vous envoyer une ambulance ? \n",
    hasNext: true,
    index: 5,
  ),
  DialogModel(
      isShowDialog: true,
      hasQuestion: true,
      dialogType: DialogType.questionRadioButton,
      dialogMessage: "Quel est le bon SBAR ?\n",
      questionTitle: "Question 5 Situation 3",
      question: "Quel est le bon SBAR ?",
      questions: [
        {
          "result": false,
          "answer": "SBAR1",
        },
        {
          "result": true,
          "answer": "SBAR2",
        },
        {
          "result": false,
          "answer": "SBAR3",
        }
      ],
      hasNext: true,
      index: 6,
      retry: true,
      trueAswers: "Bravo ! ",
      trueAswersContent:
          "Vous effectuez des transmissions structurées selon le SBAR en évoquant la situation actuelle (S), les antécédents (B), l’évaluation clinique ou « assessment » (A) et en recommandant une intervention (R). \n"
          "Vous gagnez 1 point sur la barre de qualité des soins. \n",
      falseAswers: "Non, ce n’est pas le bon SBAR ! ",
      falseAswersContent:
          "Vous perdez 1 point sur la barre de qualité des soins. Retentez ! \n",
      falseAswersContentbutnoLose: "Retentez ! \n"),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Grâce à vos connaissances et vos compétences, une ambulance s’est rendue au domicile du patient afin de le transférer dans un service de médecine interne. \n"
        "Votre prise en charge est terminée. \n"
        "Dans cette situation, vous avez acquis les compétences suivantes : identification des signes et symptômes d’une hyperglycémie, réalisation d’un examen physique et transmission de données à un professionnel de la santé en utilisant le SBAR \n\n",
    hasNext: true,
    index: 7,
    hasInteraction: true,
    dialogInteractions: [
      [
        GameInteractionTypes.contacts,
        "Urgences médicales",
        false,
        [DialogModel(isShowDialog: false)]
      ],
    ],
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Fin de la situation 3",
    hasNext: false,
    hasInteraction: true,
    index: 8,
    dialogInteractions: [
      [
        "endScenes",
        {
          "content": "M. Brocoli a été pris en charge par l'ambulance \n\n"
              "Vous avez terminé votre matinée. Il est midi, vous effectuez une pause puis vous vous rendez dans les locaux du CMS afin d’effectuer des transmissions écrites permettant d’assurer à vos collègues d’assurer la continuité des soins. Le soir, vous effectuez une balade dans le village afin d’évacuer le stress de la journée. ",
          "imageUrl": "assets/images/changeScene/nightAmbulanceScene.png",
          "title": "Fin de la situation 3",
          "nextScene": GameScenes.villageCMS
        }
      ]
    ],
  )
];
