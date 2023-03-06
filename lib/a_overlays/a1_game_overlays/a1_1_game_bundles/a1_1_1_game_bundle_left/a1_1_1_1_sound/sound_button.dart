import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:seriousgame/d_game_scenes/game_base.dart';

import 'sound_button_controller.dart';

/// This class manage the button sound that you can see on the bundle top
class SoundOverlay extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final bool flag;
  final GameSoundController gameSoundController;

  const SoundOverlay({
    super.key,
    required this.game,
    required this.overlaysSize,
    required this.flag,
    required this.gameSoundController,
  });

  @override
  Widget build(BuildContext context) {
    flag != flag;
    flag ? playSound() : stopSound();
    return Container(
      color: const Color(0x8f37474f),
      child: IconButton(
        iconSize: overlaysSize,
        icon: flag
            ? const Icon(Icons.volume_up_rounded)
            : const Icon(Icons.volume_off_rounded),
        color: flag ? Colors.amber.shade300 : Colors.green.shade200,
        onPressed: () async {
          gameSoundController.inputPlayMusic.add(!flag);
        },
      ),
    );
  }

  /// This methode is use to play a track
  playSound() {
    FlameAudio.bgm.play(game.soundTrackName);
  }

  /// This methode is use to stop the music
  stopSound() {
    FlameAudio.bgm.stop();
  }
}
