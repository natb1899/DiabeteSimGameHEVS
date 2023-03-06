import 'dart:async';

import '../../../../../e_game_controllers/base_controller.dart';

/// Controller for the player score
class ConfigButtonController extends BaseController {
  bool openConfig = false;

  late StreamController<bool> _streamConfigController;
  late Sink<bool> inputConfig;
  Stream<bool> get outputScore => _streamConfigController.stream;
  @override
  void start() {
    _streamConfigController = StreamController<bool>.broadcast();
    inputConfig = _streamConfigController.sink;
  }

  @override
  void dispose() {
    _streamConfigController.close();
  }
}

//#################################################################
