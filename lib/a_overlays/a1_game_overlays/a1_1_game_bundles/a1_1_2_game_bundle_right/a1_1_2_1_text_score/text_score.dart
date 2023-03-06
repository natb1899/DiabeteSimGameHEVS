import 'package:flutter/material.dart';

import '../../../../../d_game_scenes/game_base.dart';
import '../../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../../../z_globals/z8_font_manager.dart';

/// This class manage the text score that you can see on the bundle right
class TextScoreOverlay extends StatelessWidget {
  final DiabeteGameBase game;
  final PlayerScoreController playerScoreController;

  const TextScoreOverlay({
    super.key,
    required this.game,
    required this.playerScoreController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x8f37474f),
      child: StreamBuilder<int>(
        stream: playerScoreController.outputScore,
        initialData: playerScoreController.playerScore,
        builder: (context, score) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "score",
                style: TextStyle(
                  color: Colors.amber.shade300,
                  fontFamily: FontFamily.pixelSansSerif,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                "${score.data} %",
                style: TextStyle(
                  color: Colors.amber.shade300,
                  fontFamily: FontFamily.pixelSansSerif,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
