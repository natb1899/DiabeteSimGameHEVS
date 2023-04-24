import '../../z_globals/z1_game_manager.dart';
import '../base_controller.dart';
import 'notes_model.dart';

/// Notes controller for the notes tab in the bag
class NotesController extends BaseController {
  final Map<String, NotesModel> _notes = {
    GameCharacters.moutarde:
        NotesModel(character: GameCharacters.moutarde, notes: []),
    GameCharacters.myrtille:
        NotesModel(character: GameCharacters.myrtille, notes: []),
    GameCharacters.brocoli:
        NotesModel(character: GameCharacters.brocoli, notes: []),
    GameCharacters.fraiseux:
        NotesModel(character: GameCharacters.fraiseux, notes: []),
    GameCharacters.choux:
        NotesModel(character: GameCharacters.choux, notes: []),
    GameCharacters.apricot:
        NotesModel(character: GameCharacters.apricot, notes: []),
  };

  Map<String, NotesModel> get notes => _notes;

  @override
  void start() {}

  @override
  void dispose() {}
}
