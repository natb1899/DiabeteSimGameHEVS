import 'dart:async';

import '../../../../../d_game_scenes/game_base.dart';
import '../../../../../e_game_controllers/base_controller.dart';
import '../../../../../z_globals/z4_assets_manager.dart';

class GameSoundController extends BaseController {
  late DiabeteGameBase game;

  late String currentSoundTrack;

//utiliser par le gameBase

  //late String _poolSound;
  final List<String> tracks = [
    GameAudioAssets.ukulele,
    GameAudioAssets.adventure,
    GameAudioAssets.funday,
    GameAudioAssets.goinghigher,
    GameAudioAssets.happyrock,
    GameAudioAssets.hipjazz,
    GameAudioAssets.onceagain,
    GameAudioAssets.perception,
    GameAudioAssets.smile,
  ];

  late StreamController<String> _streamSoundController;
  late StreamController<bool> _streamSoundEnabledController;

  Stream<String> get outputSoundTrack => _streamSoundController.stream;
  Stream<bool> get outputEnableSound => _streamSoundEnabledController.stream;
  Sink<bool> get inputPlayMusic => _streamSoundEnabledController.sink;

  @override
  void start() {
    _streamSoundController = StreamController<String>.broadcast();
    _streamSoundEnabledController = StreamController<bool>.broadcast();
  }

  @override
  void dispose() {
    _streamSoundController.close();
    _streamSoundEnabledController.close();
  }
}
