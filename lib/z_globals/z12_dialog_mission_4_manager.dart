import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

/// all dialogues of the situation 4
final dialogsMission4Part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmier : \n\n"
        "Bonjour, je m’appelle Marco, je suis infirmier, comment allez-vous ce matin ?\n",
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Patient: \n\n"
        "J’ai passé une bonne nuit. Mais je ne comprends pas ce qui s’est passé hier, je me retrouve avec ce tuyau dans le bras... \n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Vous expliquez au patient qu’il se trouvait dans un état d’hyperglycémie pouvant entraîner des conséquences graves sur son état de santé, comme un coma hyperosmolaire. De plus, vous lui expliquez que dans sa situation, la décompensation de son diabète est causée par : \n",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionCheckbox,
    dialogMessage:
        "De plus, vous lui expliquez que dans sa situation, la décompensation de son diabète est causée par: ",
    hasNext: true,
    questionTitle: "Question 1, mission 4:",
    question:
        "De plus, vous lui expliquez que dans sa situation, la décompensation de son diabète est causée par: ",
    questions: [
      {
        "result": true,
        "answer":
            "L’état infectieux responsable d’un état de stress physiologique",
      },
      {
        "result": true,
        "answer":
            "La non-compliance au traitement antidiabétique sur le long terme",
      },
      {
        "result": false,
        "answer":
            "La non-compliance au traitement antidiabétique sur le court terme",
      }
    ],
    index: 3,
    falseAswers: "La réponse est incorrecte!",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins. Retentez!",
    retry: true,
    trueAswers: "Félicitations ! Il s’agit de la bonne réponse.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins.\n",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse \n",
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "A présent, vous expliquez au patient que le tuyau dans le bras est un cathéter et qu’il sert à l’administration de certains traitements comme : \n",
    hasNext: true,
    index: 4,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionCheckbox,
    dialogMessage:
        " A présent, vous expliquez au patient que le tuyau dans le bras est un cathéter et qu’il sert à l’administration de certains traitements comme :  ",
    hasNext: true,
    questionTitle: "Question 2, mission 4:",
    question:
        "A présent, vous expliquez au patient que le tuyau dans le bras est un cathéter et qu’il sert à l’administration de certains traitements comme : ",
    questions: [
      {
        "result": true,
        "answer": "L’insuline pour normaliser la glycémie",
      },
      {
        "result": false,
        "answer": "Le potassium car la pneumonie induit une carence en K+",
      },
      {
        "result": true,
        "answer": "Un antibiotique pour traiter la pneumonie",
      },
      {
        "result": true,
        "answer":
            "Le potassium car l’insulinothérapie provoque une hypokaliémie",
      },
      {
        "result": true,
        "answer": "L’hydratation pour corriger l’hypovolémie",
      }
    ],
    index: 5,
    falseAswers: "Ce n’est pas la réponse!",
    falseAswersContent:
        "Vous perdez 1 point sur la barre de qualité des soins. Retentez!",
    retry: true,
    trueAswers: "Félicitations ! Il s’agit de la bonne réponse.",
    trueAswersContent:
        "Vous gagnez 1 point sur la barre de qualité des soins.\n",
    falseAswersContentbutnoLose: "Encore une mauvaise réponse \n",
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        " Durant l’insulinothérapie i.v, vous serez particulièrement attentif à évaluer l’état mental de Monsieur Brocoli ",
    hasNext: true,
    index: 6,
  ),
  DialogModel(
    isShowDialog: true,
    hasQuestion: true,
    dialogType: DialogType.questionRadioButton,
    dialogMessage:
        "Durant l’insulinothérapie i.v, vous serez particulièrement attentif à évaluer l’état mental de Monsieur Brocoli \n",
    hasNext: true,
    questionTitle: "Question 3, mission 4:",
    question:
        "Durant l’insulinothérapie i.v, vous serez particulièrement attentif à évaluer l’état mental de Monsieur Brocoli ",
    questions: [
      {
        "result": true,
        "answer": "Vrai",
      },
      {
        "result": false,
        "answer": "Faux",
      }
    ],
    index: 7,
    retry: false,
    falseAswers: "Ce n’est pas la bonne réponse",
    falseAswersContent:
        "L’insulinothérapie peut être responsable d’un œdème cérébral. Il est indispensable d’évaluer l’état de conscience, les variations du comportement ainsi que l’orientation du patient durant le traitement. Vous perdez 1 point sur la barre de qualité des soins.  \n",
    trueAswers: " Félicitations !",
    trueAswersContent:
        "En effet, l’insulinothérapie peut être responsable d’un œdème cérébral. Vous devez évaluer l’état de conscience, les variations du comportement ainsi que l’orientation du patient durant le traitement. Vous gagnez 1 point sur la barre de qualité des soins. \n",
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        " Bravo, vous avez terminé la prise en charge de Monsieur Brocoli. Dans cette situation, vous avez été amené à agir en tant que praticien réflexif dans une situation de soin complexe. Vous pouvez poursuivre votre matinée en vous rendant dans la chambre de Monsieur Fraiseux. ",
    hasNext: true,
    index: 8,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: " Vous allez à présent recevoir un feedback. ",
    hasNext: true,
    index: 9,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: " Vous allez à présent recevoir un feedback. ",
    hasNext: false,
    hasInteraction: true,
    index: 10,
    dialogInteractions: [
      [
        "feedback",
        {
          "ms+": "bravo bla bla blab",
          "ms": "pas trop mal",
          "ms-": "catastrophique"
        }
      ]
    ],
  ),
];
final dialogsMission4Part2 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Je suis M.Brocoli",
    hasNext: false,
    index: 0,
  )
];
