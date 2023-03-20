import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_3_configuration/config_button_controller.dart';

import '../../../../../d_game_scenes/game_base.dart';
import 'login_button_controller.dart';

/// This class manage the button setting that you can see on the bundle top
class LoginOverlay extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final LoginButtonController loginButtonController;

  const LoginOverlay({
    super.key,
    required this.game,
    required this.overlaysSize,
    required this.loginButtonController,
  });

// For the moment, onPressed do nothing
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x8f37474f),
      child: IconButton(
        icon: const Icon(Icons.settings),
        color: Colors.amber.shade300,
        iconSize: overlaysSize,
        onPressed: () {
          bool openBag = loginButtonController.openConfig;
          loginButtonController.openConfig = !openBag;
          openBag = !openBag;
          loginButtonController.inputConfig.add(
            openBag,
          );
        },
      ),
    );
  }
}