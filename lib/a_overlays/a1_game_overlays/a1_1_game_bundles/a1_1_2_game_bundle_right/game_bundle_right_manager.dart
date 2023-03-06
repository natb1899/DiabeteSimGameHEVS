import 'package:flutter/material.dart';

import '../../../../d_game_scenes/game_base.dart';
import '../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import 'a1_1_2_1_text_score/text_score.dart';
import 'a1_1_2_2_slider_score/slider_score.dart';
import 'a1_1_2_3_bag_button/bag_button.dart';

/// This class manage the display of all overlays that you can see on the bundle right
class GameBundleRight extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;
  final PlayerScoreController playerScoreController;
  const GameBundleRight(
      {Key? key,
      required this.game,
      required this.overlaysSize,
      required this.playerBagController,
      required this.playerScoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextScoreOverlay(
            game: game,
            playerScoreController: playerScoreController,
          ),
          Expanded(
            child: SliderScoreOverlay(
              game: game,
              playerScoreController: playerScoreController,
            ),
          ),
          BagButtonsOverlay(
            game: game,
            playerBagController: playerBagController,
          )
        ],
      ),
    );
  }
}
