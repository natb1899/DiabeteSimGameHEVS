import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './dialog_controller.dart';
import '../../../../../../z_globals/z8_font_manager.dart';
import '../../../../../d_game_scenes/game_base.dart';
import '../../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../../../y_common_widget/show_alert_dialog.dart';
import '../../../../../z_globals/z1_game_manager.dart';
import 'dialog_checkbox.dart';
import 'dialog_model.dart';
import 'dialog_radiobutton.dart';
import 'dialog_text_field.dart';

/// this class contain the widget (overlay) for the dialogue
class DialogOverlay extends StatelessWidget {
  final DiabeteGameBase game;
  final GameDialogController gameDialogController;
  final PlayerScoreController playerScoreController;
  final DialogModel dialog;

  const DialogOverlay({
    Key? key,
    required this.playerScoreController,
    required this.game,
    required this.dialog,
    required this.gameDialogController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.player.canMove = false;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: const Color.fromARGB(181, 201, 210, 182),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...(dialog.dialogType == DialogType.display
                ? _displayDialog(dialog, context)
                : _displayQuestion(dialog, context)),
          ],
        ),
      ),
    );
  }

  /// methode to show a question dialogue
  _displayQuestion(DialogModel dialog, BuildContext context) {
    if (dialog.hasInteraction!) {
      _resolveInteraction(context);
    }
    switch (dialog.dialogType) {
      case DialogType.questionCheckbox:
        return [
          ..._getCheckBoxQuestion(),
          const SizedBox(height: 20),
          _getCheckBoxAnswerSubmissionRegime(context)
        ];
      case DialogType.questionRadioButton:
        return [
          ..._getRadioButtonQuestion(),
          const SizedBox(height: 20),
          _getRadioAnswerSubmissionRegime(context)
        ];
      case DialogType.questionInput:
        return [
          ..._getInputQuestion(),
          const SizedBox(height: 20),
          _getInputSubmissionRegime(context)
        ];
      default:
    }
  }

  /// get a input question
  _getInputQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: FontSizeManager.s12,
          fontFamily: FontFamily.pixelSansSerif,
        ),
      ),
      const SizedBox(height: 20),
      DialogInputQuestion(
        gameDialogController: gameDialogController,
      ),
    ];
  }

  /// manage the answer of the input question
  _getInputSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            String? answer = gameDialogController.inputAnswer;
            if (answer != null) {
              if (answer == dialog.questions![0]['answer']) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content: dialog.trueAswersContent!,
                    defaultActionText: 'OK',
                    title: dialog.trueAswers!,
                  );
                }
                gameDialogController.inputAnswer = null;
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                if (dialog.retry) {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                } else {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                }
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content: "Veuillez s'il vous plait saisir une réponse !",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "Valider",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// get a radioButton question
  _getRadioButtonQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: FontSizeManager.s12,
          fontFamily: FontFamily.pixelSansSerif,
        ),
      ),
      const SizedBox(height: 20),
      DialogRadioButton(
        gameDialogController: gameDialogController,
        answers: dialog.questions!,
      ),
    ];
  }

  /// manage the answer of a radio button question
  _getRadioAnswerSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            String? answer = gameDialogController.radioAnswer;
            if (answer != null) {
              if (_isResultTrue(answer)) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content: dialog.trueAswersContent!,
                    defaultActionText: 'OK',
                    title: dialog.trueAswers!,
                  );
                }
                gameDialogController.inputAnswer = null;
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                if (dialog.retry) {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                } else {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                  gameDialogController.inputAnswer = null;
                  nextAction(dialog.hasNext);
                }
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content: "Veuillez s'il vous plait cocher une réponse !",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "Valider",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// manage the answer of a checkbox question
  Row _getCheckBoxAnswerSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            if (gameDialogController.answersTracker.contains(true)) {
              bool result = const ListEquality().equals(
                  dialog.questioAnswer, gameDialogController.answersTracker);
              if (result) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content: dialog.trueAswersContent!,
                    defaultActionText: 'OK',
                    title: dialog.trueAswers!,
                  );
                }
                gameDialogController.inputAnswer = null;
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                if (dialog.retry) {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                } else {
                  showAlertDialog(
                    context,
                    content: scoreFlag
                        ? dialog.falseAswersContent!
                        : dialog.falseAswersContentbutnoLose!,
                    defaultActionText: 'OK',
                    title: dialog.falseAswers!,
                  );
                  gameDialogController.inputAnswer = null;
                  nextAction(dialog.hasNext);
                }
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content:
                    "Veuillez s'il vous plait cocher une ou plusieurs réponses",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "Valider",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// get a checkbox question
  _getCheckBoxQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: FontSizeManager.s12,
          fontFamily: FontFamily.pixelSansSerif,
        ),
      ),
      const SizedBox(height: 20),
      ..._getCheckBoxAnswersElement(),
    ];
  }

  /// display simple dialog
  _displayDialog(
    DialogModel? dialog,
    BuildContext context,
  ) {
    if (dialog!.hasInteraction!) {
      _resolveInteraction(context);
    }
    return [
      _getAnimatedText(dialog.dialogMessage!,
          callback: () =>
              gameDialogController.inputHasNextDialog.add(dialog.hasNext)),
      StreamBuilder<bool>(
        stream: gameDialogController.outputHasNextDialog,
        builder: (context, hasNext) {
          return hasNext.hasData
              ? _displayDialogButton(
                  context,
                  hasNext.data!,
                )
              : Container();
        },
      ),
    ];
  }

  /// this methode manage the animation of the text
  _getAnimatedText(String text,
      {VoidCallback? callback, double? fontsize = FontSizeManager.s12}) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: fontsize,
            fontFamily: FontFamily.pixelSansSerif,
          ),
          speed: const Duration(
            milliseconds: kDebugMode ? 1 : 60, // Speed dialog faster in dev
          ),
        ),
      ],
      isRepeatingAnimation: false,
      onFinished: callback,
    );
  }

  /// this methode display the next or close buttons after the dialogue
  _displayDialogButton(BuildContext context, bool hasNext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            nextAction(hasNext);
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: Text(
            hasNext ? "suite " : "fermer",
            style: const TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  void nextAction(bool hasNext) {
    disableDialog(hasNext);
    Future.delayed(
      const Duration(milliseconds: 10),
      () => {
        if (hasNext) gameDialogController.onNextDialog(),
      },
    );
  }

  disableDialog(bool hasNext) {
    gameDialogController.onDialog(
      DialogModel(isShowDialog: false),
    );
    game.player.canMove = hasNext ? false : true;
    print("Player can move :" + game.player.canMove.toString());
  }

  _getCheckBoxAnswersElement() {
    return dialog.questions?.asMap().entries.map((answer) {
      gameDialogController.answersTracker.add(false);
      return Row(
        children: [
          DialogCheckbox(
            gameDialogController: gameDialogController,
            questionIndex: answer.key,
          ),
          Text(
            answer.value["answer"],
            style: const TextStyle(
              fontSize: FontSizeManager.s12,
              fontFamily: FontFamily.pixelSansSerif,
            ),
          )
        ],
      );
    }).toList();
  }

  bool _isResultTrue(String answer) {
    print(answer);
    print((dialog.questions!
        .where((element) => element.containsValue(answer))
        .first["result"]));
    return ((dialog.questions!
        .where((element) => element.containsValue(answer))
        .first["result"]));
  }

  void _resolveInteraction(BuildContext context) {
    dialog.dialogInteractions?.forEach((interactionList) {
      final String gameInteraction = interactionList[0];
      switch (gameInteraction) {
        case GameInteractionTypes.tools:
          final String objectInteraction = interactionList[1];
          final List<dynamic> valueInteraction = interactionList[2];
          final int indexTracker = interactionList[3];
          final List<DialogModel> nextDialogs = interactionList[4];
          gameDialogController
              .gameSceneController.measureToolController.toolsUsageTrackers
              .add(false);
          gameDialogController
              .gameInteractions[gameInteraction]![objectInteraction]
            ..isUsable = valueInteraction[0]
            ..toolDialog = valueInteraction[1]
            ..indexTracker = indexTracker
            ..nextDialogs = nextDialogs;
          break;

        case GameInteractionTypes.contacts:
          final String objectInteraction = interactionList[1];
          final bool isReachable = interactionList[2];
          final List<DialogModel> dialog = interactionList[3];

          gameDialogController
              .gameInteractions[gameInteraction]![objectInteraction]
            ..isReachable = isReachable
            ..dialog = dialog;
          break;
        case GameInteractionTypes.endScenes:
          final Map<String, String> objectInteraction = interactionList[1];
          gameDialogController.gameSceneController.endScene(
            context: context,
            content: objectInteraction["content"]!,
            imageUrl: objectInteraction["imageUrl"],
            title: objectInteraction["title"]!,
            nextScene: objectInteraction["nextScene"]!,
          );
          break;
        case GameInteractionTypes.notes:
          // Is like ['notes', 'brocoli', 'Ceci est la nouvelle note de brocoli']
          final String characterNotes = interactionList[1];
          final String newNote = interactionList[2];

          debugPrint('Character : $characterNotes');
          debugPrint('newNote : $newNote');

          gameDialogController
              .gameInteractions[gameInteraction]![characterNotes].notes
              .add(newNote);
          break;
        case GameInteractionTypes.feedback:
          final Map<String, String> objectInteraction = interactionList[1];
          print("testend");
          gameDialogController
              .gameSceneController.feedBackController.inputfeedback
              .add(true);
          gameDialogController.gameSceneController.showFeedback();
          break;
        default:
      }
    });
  }
}
