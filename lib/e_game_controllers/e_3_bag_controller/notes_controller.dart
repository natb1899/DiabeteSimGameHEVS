import '../../z_globals/z1_game_manager.dart';
import '../base_controller.dart';
import 'notes_model.dart';

/// Notes controller for the notes tab in the bag
class NotesController extends BaseController {
  final Map<String, NotesModel> _notes = {
    GameCharacters.moutarde:
        NotesModel(character: GameCharacters.moutarde, notes: []),
    GameCharacters.brocoli:
        NotesModel(character: GameCharacters.brocoli, notes: []),
  };

  Map<String, NotesModel> get notes => _notes;

  @override
  void start() {}

  @override
  void dispose() {}
}
