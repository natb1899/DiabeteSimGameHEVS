import 'package:flutter/material.dart';

import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';
import 'z1_game_manager.dart';
import 'z3_strings_manager.dart';

/// all the dialogs for the situation 2
final dialogsMission2part1 = <DialogModel>[
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Infirmière: \n\n"
        "Hello Mme. Myrtille, je m'appelle Marie, je suis infirmière au CMS. Comment allez-vous aujourd'hui ?\n",
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Patient: \n\n"
        "...\n",
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Mme. Myrtille est en colère, elle estime ne pas avoir besoin des services du CMS.\n"
        "D'après elle, votre présence est inutile et elle ne veut pas vous parler.\n",
    index: 2,
  ),
];

final dialogsMission2part2 = <DialogModel>[
  //talk to housband
];
