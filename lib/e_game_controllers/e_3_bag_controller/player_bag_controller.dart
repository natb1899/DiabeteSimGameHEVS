import 'dart:async';

import '../../d_game_scenes/game_base.dart';
import '../base_controller.dart';

/// Controller for the tools menu (bag)
class PlayerBagController extends BaseController {
  late DiabeteGameBase game;
  bool _openBag = false;
  late StreamController<bool> _streamBagController;
  late Sink _inputBag;

  Stream<bool> get outputBag => _streamBagController.stream;

  bool get bagState => _openBag;

  /// Changing the bag state and transmit it to the sink
  updateBagState() {
    _openBag = !_openBag;
    _inputBag.add(_openBag);
  }

  /// Launch the controller
  @override
  void start() {
    _streamBagController = StreamController<bool>.broadcast();
    _inputBag = _streamBagController.sink;
  }

  /// Ends the controller
  @override
  void dispose() {
    _streamBagController.close();
  }

  void closeBag() {
    updateBagState();
    bagState ? game.pauseEngine() : game.resumeEngine();
  }
}
