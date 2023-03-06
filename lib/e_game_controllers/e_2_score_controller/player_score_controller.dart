import 'dart:async';

import '../../z_globals/z1_game_manager.dart';
import '../base_controller.dart';

/// Controller for the player score
class PlayerScoreController extends BaseController {
  int _playerScore = PlayerBehavior.initialScore;

  int get playerScore => _playerScore;
  late StreamController<int> _streamScoreController;
  late Sink<int> _inputScore;
  Stream<int> get outputScore => _streamScoreController.stream;

  /// increasing or decreasing player score
  updateScore(bool result) {
    if (result) {
      _playerScore += 1;
    } else {
      _playerScore -= 1;
    }
    _inputScore.add(_playerScore);
  }

  /// Launch the controller
  @override
  void start() {
    _streamScoreController = StreamController<int>.broadcast();
    _inputScore = _streamScoreController.sink;
  }

  /// Ends the controller
  @override
  void dispose() {
    _streamScoreController.close();
  }
}

//#################################################################
