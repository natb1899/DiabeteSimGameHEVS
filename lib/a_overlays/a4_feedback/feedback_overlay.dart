import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import '../../d_game_scenes/game_base.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z5_color_manager.dart';
import '../../z_globals/z8_font_manager.dart';
import '../../z_globals/z9_ui_values_manager.dart';
import '../a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import '../a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

class FeedBackOverlay extends StatelessWidget {
  final GameScenesController gameScenesController;
  final DiabeteGameBase game;
  final GameDialogController gameDialogController;
  final PlayerScoreController playerScoreController;
  final DialogModel dialog;

  const FeedBackOverlay({
    Key? key,
    required this.playerScoreController,
    required this.game,
    required this.dialog,
    required this.gameDialogController,
    required this.gameScenesController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedBack : '),
        centerTitle: false,
        elevation: GameSize.s4,
        actions: [
          TextButton(
            onPressed: () {
              html.window.location.reload();
            },
            child: const Text(
              "REPLAY ->",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...(_displayDialog(dialog, context)),
            ],
          ),
        ),
      ),
      backgroundColor: ColorManager.lightGrey,
    );
  }

  List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  Widget buildLabel({String label = ""}) {
    return SizedBox(
      width: 25,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorManager.appPurpleColor,
            fontSize: GameSize.s16,
            fontFamily: FontFamily.pixelSansSerif),
      ),
    );
  }

  /// display simple dialog
  _displayDialog(
    DialogModel? dialog,
    BuildContext context,
  ) {
    return [
      _getAnimatedText(dialog!.dialogMessage!,
          callback: () =>
              gameDialogController.inputHasNextDialog.add(dialog.hasNext)),
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
}
