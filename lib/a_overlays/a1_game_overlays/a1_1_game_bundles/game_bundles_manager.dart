import 'package:flutter/material.dart';

import '../../../d_game_scenes/game_base.dart';
import '../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import 'a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';
import 'a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_controller.dart';
import 'a1_1_1_game_bundle_left/game_bundle_left_manager.dart';
import 'a1_1_2_game_bundle_right/game_bundle_right_manager.dart';

/// This class manage of all bundle overlays that you can see on the map. bundle top and right for the moment
class GameBundlesManager extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;
  final PlayerScoreController playerScoreController;
  final GameDialogController gameDialogController;
  final GameSoundController gameSoundController;
  final ConfigButtonController configButtonController;
  const GameBundlesManager({
    Key? key,
    required this.game,
    required this.overlaysSize,
    required this.playerBagController,
    required this.playerScoreController,
    required this.gameDialogController,
    required this.gameSoundController,
    required this.configButtonController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 9,
          child: GameBundleLeft(
            game: game,
            overlaysSize: overlaysSize,
            gameDialogController: gameDialogController,
            playerScoreController: playerScoreController,
            gameSoundController: gameSoundController,
            configButtonController: configButtonController,
          ),
        ),
        Expanded(
          flex: 1,
          child: GameBundleRight(
            game: game,
            overlaysSize: overlaysSize,
            playerBagController: playerBagController,
            playerScoreController: playerScoreController,
          ),
        )
      ],
    );
  }
}
