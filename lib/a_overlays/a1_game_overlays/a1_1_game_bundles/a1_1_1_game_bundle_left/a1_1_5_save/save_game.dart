import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/f_firebase/firebase.dart';

import '../../../../../d_game_scenes/game_base.dart';

/// This class manage the button "pause" that you can see on the bundle top
class SaveOverlay extends StatefulWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final PlayerScoreController playerScoreController;

  const SaveOverlay({
    super.key,
    required this.game,
    required this.overlaysSize,
    required this.playerScoreController,
  });

  @override
  State<SaveOverlay> createState() => _SaveOverlayState();
}

class _SaveOverlayState extends State<SaveOverlay> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x8f37474f),
      child: IconButton(
        iconSize: widget.overlaysSize,
        icon: const Icon(Icons.save),
        color: Colors.amber.shade300,
        onPressed: () {
          DatabaseManager db = DatabaseManager();
          db.saveGame(
              currentLevel: widget.game.gameScenesController.scene.sceneName,
              id: auth.currentUser?.uid);
        },
      ),
    );
  }
}
