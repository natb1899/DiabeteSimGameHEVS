import '../../../e_game_controllers/base_controller.dart';
import 'contact_model.dart';

/// Contacts controller

class ContactsController extends BaseController {
  final Map<String, Contact> _contactMap = {
    "Urgences médicales": Contact(
      name: "Urgences médicales",
      phoneNumber: "144",
      image: "urgence.png",
    ),
    "Médecin": Contact(
      name: "Médecin traitant",
      phoneNumber: "+41 786 65 85",
      image: "medecin.png",
    ),
    "Bureau": Contact(
      name: "Bureau du CMS",
      phoneNumber: "+41 786 65 87",
      image: "infirmiere.png",
    ),
    "Diététicienne": Contact(
      name: "Diététicienne",
      phoneNumber: "+41 786 65 86",
      image: "dieteticiene.png",
    ),
    "Physiothérapeute": Contact(
      name: "Physiothérapeute en réadaptation cardiovasculaire",
      phoneNumber: "+41 786 65 89",
      image: "physio.png",
    ),
    "Infirmiere": Contact(
      name: "Infirmiere de liaison",
      phoneNumber: "+41 786 65 87",
      image: "infirmiere.png",
    ),
    "Tabacologue": Contact(
      name: "Tabacologue",
      phoneNumber: "+41 786 65 88",
      image: "tabacologue.png",
    ),
    "Aumômier": Contact(
      name: "Aumômier",
      phoneNumber: "+41 745 56 21",
      image: "physio.png",
    ),
  };

  Map<String, Contact> get contactMap => _contactMap;

  List<Contact> get contactList => _contactMap.values.toList();

  @override
  void start() {}

  @override
  void dispose() {}
}
