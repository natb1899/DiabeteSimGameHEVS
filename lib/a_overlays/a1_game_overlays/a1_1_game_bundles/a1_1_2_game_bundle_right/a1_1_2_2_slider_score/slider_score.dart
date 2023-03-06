import 'package:flutter/material.dart';

import '../../../../../d_game_scenes/game_base.dart';
import '../../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../../../z_globals/z5_color_manager.dart';

/// This class manage the slider showing the score that you can see on the bundle right
class SliderScoreOverlay extends StatelessWidget {
  final PlayerScoreController playerScoreController;
  final DiabeteGameBase game;
  const SliderScoreOverlay(
      {super.key, required this.game, required this.playerScoreController});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: playerScoreController.outputScore,
        initialData: playerScoreController.playerScore,
        builder: (context, score) {
          return SizedBox(
            child: RotatedBox(
              quarterTurns: 3,
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: getColorIndicator(score.data! + 0.0),
                  trackShape: const RectangularSliderTrackShape(),
                  inactiveTrackColor: ColorManager.primary,
                  thumbColor: Colors.amber.shade300,
                  trackHeight: 16,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 4),
                ),
                child: Slider(
                  min: 0,
                  max: 100,
                  divisions: 100,
                  value: score.data! + 0.0,
                  onChanged: (_) {},
                ),
              ),
            ),
          );
        });
  }

  /// The color of the Slider change depending of the score
  Color getColorIndicator(double? score) {
    if (score! < 40) return ColorManager.error;
    if (score <= 50) return ColorManager.darkPrimary;
    return ColorManager.success;
  }
}
