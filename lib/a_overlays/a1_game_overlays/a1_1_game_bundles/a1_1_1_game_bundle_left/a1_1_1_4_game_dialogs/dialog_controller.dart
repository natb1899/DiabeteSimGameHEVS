import 'dart:async';

import '../../../../../e_game_controllers/base_controller.dart';
import '../../../../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../../../../z_globals/z1_game_manager.dart';
import 'dialog_model.dart';

/// controller of all dialogue
class GameDialogController extends BaseController {
  late GameScenesController gameSceneController;
  DialogModel? _dialogModel;
  List<DialogModel>? _dialogList;
  late Map<String, dynamic> gameInteractions = {};

  late StreamController<DialogModel> _streamDialogController;
  late StreamController<bool> _streamHasNextDialogController;
  late StreamController<bool> _streamHasQuestionController;

  Sink<DialogModel> get inputDialog => _streamDialogController.sink;

  Sink<bool> get inputHasNextDialog => _streamHasNextDialogController.sink;

  Sink<bool> get inputHasQuestion => _streamHasQuestionController.sink;

  Stream<DialogModel> get outputDialog => _streamDialogController.stream;

  Stream<bool> get outputHasNextDialog => _streamHasNextDialogController.stream;

  Stream<bool> get outputHasQuestion => _streamHasQuestionController.stream;

  List<bool> answersTracker = [];
  bool? binaryAnswer;
  String? radioAnswer;
  String? inputAnswer;

  @override
  void start() {
    _streamDialogController = StreamController<DialogModel>.broadcast();
    _streamHasNextDialogController = StreamController<bool>.broadcast();
    _streamHasQuestionController = StreamController<bool>.broadcast();
    gameInteractions[GameInteractionTypes.tools] =
        gameSceneController.measureToolController.measureTools;
    gameInteractions[GameInteractionTypes.contacts] =
        gameSceneController.contactsController.contactMap;
    gameInteractions[GameInteractionTypes.notes] =
        gameSceneController.notesController.notes;
  }

  @override
  void dispose() {
    _streamDialogController.close();
    _streamHasNextDialogController.close();
    _streamHasQuestionController.close();
  }

  onDialog(DialogModel dialogModel) async {
    inputDialog.add(dialogModel);
  }

  onDialogList(List<DialogModel> dialogList) {
    _dialogList = dialogList;
    _dialogModel = _dialogList![0];
    if (_dialogList!.isNotEmpty) onDialog(_dialogList![0]);
  }

  onNextDialog() {
    if (_dialogList!.isNotEmpty) {
      if (_dialogModel!.index! + 1 < _dialogList!.length) {
        _dialogModel = _dialogList![(_dialogModel!.index!) + 1];
        onDialog(_dialogModel!);
      }
    }
    answersTracker = [];
  }

  void sendInitialMessage(initialMessage) {
    onDialog(
      DialogModel(
        isShowDialog: true,
        dialogMessage: initialMessage,
      ),
    );
  }
}
