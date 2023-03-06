import '../../../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

/// this class is a template for the contact objects used for the list of professionals in the bag
class Contact {
  String name;
  String phoneNumber;
  String? image;
  bool? isReachable;
  List<DialogModel>? dialog;

  Contact(
      {required this.name,
      required this.phoneNumber,
      this.dialog,
      this.isReachable = false,
      this.image});
}
