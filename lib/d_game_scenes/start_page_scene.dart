import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../z_globals/z1_game_manager.dart';
import 'game_base.dart';

/// Landing page.
class StartPage extends DiabeteGameBase with HasTappableComponents {
  StartPage({
    required GameScenesController gameScenesController,
    required GameSoundController gameSoundController,
    required String soundTrackName,
    required String sceneName,
    required String previousMissionName,
  }) : super(
          soundTrackName: soundTrackName,
          gameScenesController: gameScenesController,
          gameSoundController: gameSoundController,
          sceneName: sceneName,
          previousMissionName: previousMissionName,
        ) {
    addAll(
      [
        _logo = TextComponent(
          text: 'DiabeteSim Serious Game',
          textRenderer: TextPaint(
            style: const TextStyle(
              fontSize: 64,
              color: Color(0xFFC8FFF5),
              fontWeight: FontWeight.w800,
            ),
          ),
          anchor: Anchor.center,
        ),
        _button1 = RoundedButton(
          text: 'play',
          action: () {
            gameScenesController.openScene(GameScenes.villageCMS);
          },
          color: const Color(0xffadde6c),
          borderColor: const Color(0xffedffab),
        ),
        _button2 = RoundedButton(
          text: 'config',
          action: () {
            bool openConfig =
                gameScenesController.configButtonController.openConfig;
            gameScenesController.configButtonController.openConfig =
                !openConfig;
            openConfig = !openConfig;
            gameScenesController.configButtonController.inputConfig.add(
              openConfig,
            );
          },
          color: const Color(0xffdebe6c),
          borderColor: const Color(0xfffff4c7),
        ),
      ],
    );
  }

  late final TextComponent _logo;
  late final RoundedButton _button1;
  late final RoundedButton _button2;

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    _logo.position = Vector2(canvasSize.x / 2, canvasSize.y / 3);
    _button1.position = Vector2(canvasSize.x / 2, _logo.y + 80);
    _button2.position = Vector2(canvasSize.x / 2, _logo.y + 140);
  }
}

@override
void addOverlays() {
  return;
}

class RoundedButton extends PositionComponent with TapCallbacks {
  RoundedButton({
    required this.text,
    required this.action,
    required Color color,
    required Color borderColor,
    super.anchor = Anchor.center,
  }) : _textDrawable = TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w800,
          ),
        ).toTextPainter(text) {
    size = Vector2(150, 40);
    _textOffset = Offset(
      (size.x - _textDrawable.width) / 2,
      (size.y - _textDrawable.height) / 2,
    );
    _rrect = RRect.fromLTRBR(0, 0, size.x, size.y, Radius.circular(size.y / 2));
    _bgPaint = Paint()..color = color;
    _borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;
  }

  final String text;
  final void Function() action;
  final TextPainter _textDrawable;
  late final Offset _textOffset;
  late final RRect _rrect;
  late final Paint _borderPaint;
  late final Paint _bgPaint;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(_rrect, _bgPaint);
    canvas.drawRRect(_rrect, _borderPaint);
    _textDrawable.paint(canvas, _textOffset);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.05);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }
}
