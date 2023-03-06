import '../a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

/// tools model
class MeasureToolModel {
  String name;
  String? image;
  String defaultDialog;
  DialogModel? toolDialog;
  bool? isUsable;
  int? indexTracker;
  List<DialogModel>? nextDialogs;

  MeasureToolModel({
    required this.name,
    this.toolDialog,
    this.image,
    this.defaultDialog = "Vous ne pouvez pas utiliser l'outil.",
    this.isUsable = false,
    this.indexTracker,
    this.nextDialogs,
  });
}
