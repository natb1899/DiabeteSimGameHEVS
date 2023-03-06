import 'dart:async';

import '../../../../../e_game_controllers/base_controller.dart';

/// Controller for the player score
class FeedBackController extends BaseController {
  bool openfeedback = false;

  late StreamController<bool> _streamFeedbackController;
  late Sink<bool> inputfeedback;
  Stream<bool> get outputFeedback => _streamFeedbackController.stream;
  @override
  void start() {
    _streamFeedbackController = StreamController<bool>.broadcast();
    inputfeedback = _streamFeedbackController.sink;
  }

  @override
  void dispose() {
    _streamFeedbackController.close();
  }
}
