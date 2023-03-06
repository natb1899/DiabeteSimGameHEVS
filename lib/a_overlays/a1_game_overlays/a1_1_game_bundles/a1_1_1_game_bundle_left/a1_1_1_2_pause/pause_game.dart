import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../../../../../d_game_scenes/game_base.dart';

/// This class manage the button "pause" that you can see on the bundle top
class PauseOverlay extends StatefulWidget {
  final double overlaysSize;
  final DiabeteGameBase game;

  const PauseOverlay({
    super.key,
    required this.game,
    required this.overlaysSize,
  });

  @override
  State<PauseOverlay> createState() => _PauseOverlayState();
}

class _PauseOverlayState extends State<PauseOverlay> {
  bool pause = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x8f37474f),
      child: IconButton(
        iconSize: widget.overlaysSize,
        icon: !pause ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
        color: pause ? Colors.amber.shade300 : Colors.green.shade200,
        onPressed: () {
          setState(() {
            pause = !pause;
          });
          if (pause) {
            widget.game.pauseEngine();

            if (FlameAudio.bgm.isPlaying) {
              FlameAudio.bgm.pause();
            }
          } else {
            widget.game.resumeEngine();
            if (!FlameAudio.bgm.isPlaying) {
              FlameAudio.bgm.resume();
            }
          }
        },
      ),
    );
  }
}
