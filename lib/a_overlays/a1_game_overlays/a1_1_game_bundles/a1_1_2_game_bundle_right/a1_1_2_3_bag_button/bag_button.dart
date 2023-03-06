import 'package:flutter/material.dart';

import '../../../../../d_game_scenes/game_base.dart';
import '../../../../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';

/// This class manage the bag that you can see on the bundle right
class BagButtonsOverlay extends StatelessWidget {
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;

  const BagButtonsOverlay({
    super.key,
    required this.game,
    required this.playerBagController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playerBagController.updateBagState();
        game.pauseEngine();
      },
      child: Image.asset(
        'assets/images/gameObjects/bag.png',
        fit: BoxFit.cover, // Fixes border issues
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}
