import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';

import '../../../../d_game_scenes/game_base.dart';
import '../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'a1_1_1_1_sound/sound_button.dart';
import 'a1_1_1_1_sound/sound_button_controller.dart';
import 'a1_1_1_2_pause/pause_game.dart';
import 'a1_1_1_3_configuration/config_button.dart';
import 'a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'a1_1_1_4_game_dialogs/dialog_model.dart';
import 'a1_1_1_4_game_dialogs/dialog_overlay.dart';

/// This class manage the display of all overlays that you can see on the bundle top
class GameBundleLeft extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final GameDialogController gameDialogController;
  final PlayerScoreController playerScoreController;
  final GameSoundController gameSoundController;
  final ConfigButtonController configButtonController;
  const GameBundleLeft({
    Key? key,
    required this.game,
    required this.overlaysSize,
    required this.gameDialogController,
    required this.playerScoreController,
    required this.gameSoundController,
    required this.configButtonController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            StreamBuilder<bool>(
                stream: gameSoundController.outputEnableSound,
                initialData: true,
                builder: (context, snapshot) {
                  return SoundOverlay(
                    game: game,
                    overlaysSize: overlaysSize,
                    flag: snapshot.data!,
                    gameSoundController: gameSoundController,
                  );
                }),

            ConfigOverlay(
              game: game,
              overlaysSize: overlaysSize,
              configButtonController: configButtonController,
            ),
            PauseOverlay(game: game, overlaysSize: overlaysSize),
            // PauseOverlay(game: game, overlaysSize: overlaysSize),
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: StreamBuilder<DialogModel>(
                    stream: gameDialogController.outputDialog,
                    builder: (context, dialog) => dialog.hasData
                        ? displayDialog(dialog.data!)
                        : Container(),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget displayDialog(DialogModel dialog) {
    return dialog.isShowDialog
        ? DialogOverlay(
            game: game,
            dialog: dialog,
            gameDialogController: gameDialogController,
            playerScoreController: playerScoreController,
          )
        : Container();
  }
}
