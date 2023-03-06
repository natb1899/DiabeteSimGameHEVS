import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/measure_tool_model.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/z_globals/z3_strings_manager.dart';
import 'package:seriousgame/z_globals/z8_font_manager.dart';

import '../../b_game_objects/b2_map_objects/b3_bag_objects/contact_onBag.dart';
import '../../b_game_objects/b2_map_objects/b3_bag_objects/notes_onBag.dart';
import '../../d_game_scenes/game_base.dart';
import '../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

/// This class manages the overlay that appears when you click on the bag in the right bundle.
class PlayerBag extends StatelessWidget {
  final DiabeteGameBase game;
  final GameScenesController gameScenesController;
  final PlayerBagController playerBagController;

  const PlayerBag({
    super.key,
    required this.game,
    required this.gameScenesController,
    required this.playerBagController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 600,
          height: 600,
          child: DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.health_and_safety)),
                      Tab(icon: Icon(Icons.calendar_month)),
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.email)),
                      Tab(icon: Icon(Icons.school)),
                      Tab(icon: Icon(Icons.sticky_note_2_sharp))
                    ],
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(BagMenu.titleWidget),
                        CloseButton(
                          onPressed: () {
                            playerBagController.closeBag();
                          },
                        )
                      ])),
              body: TabBarView(
                children: [
                  SafeArea(
                      child: Column(children: [
                    Row(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Outils de mesure :",
                              style: TextStyle(
                                fontSize: FontSizeManager.s12,
                                fontFamily: FontFamily.pixelSansSerif,
                              )),
                        )
                      ],
                    ),
                    Flexible(
                        child: ListView(
                      children: [
                        ...(gameScenesController
                            .measureToolController.measureTools.values
                            .map(
                              (measureTool) => Card(
                                elevation: 2.0,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.medical_information),
                                        const SizedBox(width: 15),
                                        TextButton(
                                            onPressed: () {
                                              measureTool.isUsable!
                                                  ? _showMeasureToolDialog(
                                                      measureTool)
                                                  : _showToolDefaultDialog(
                                                      measureTool);
                                            },
                                            child: Text(
                                              measureTool.name,
                                              style: const TextStyle(
                                                fontSize: FontSizeManager.s12,
                                                fontFamily:
                                                    FontFamily.pixelSansSerif,
                                              ),
                                            )),
                                      ],
                                    )),
                              ),
                            )
                            .toList())
                      ],
                    )),
                  ])),
                  SafeArea(
                      child: Column(
                    children: [
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(Planning.patientsTitle,
                                style: TextStyle(
                                  fontSize: FontSizeManager.s12,
                                  fontFamily: FontFamily.pixelSansSerif,
                                )),
                          )
                        ],
                      ),
                      Flexible(
                          child: ListView(
                        children: const [
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.patient1,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.patient2,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.patient3,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                        ],
                      )),
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(Planning.chambresTitle,
                                style: TextStyle(
                                  fontSize: FontSizeManager.s12,
                                  fontFamily: FontFamily.pixelSansSerif,
                                )),
                          )
                        ],
                      ),
                      Flexible(
                          child: ListView(
                        children: const [
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.chambre23,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.chambre24,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.chambre25,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Planning.chambre26,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                        ],
                      ))
                    ],
                  )),
                  SafeArea(
                      child: Column(
                    children: [
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child:
                                Text(PatientsSituation.patientsSituationTitle,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s12,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    )),
                          )
                        ],
                      ),
                      Flexible(
                          child: ListView(
                        children: const [
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text(PatientsSituation.patientsSituation1,
                                        style: TextStyle(
                                          fontSize: FontSizeManager.s12,
                                          fontFamily: FontFamily.pixelSansSerif,
                                        ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    PatientsSituation.patientsSituation1Desc,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s8,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                        ],
                      )),
                      Flexible(
                          child: ListView(
                        children: const [
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text(PatientsSituation.patientsSituation2,
                                        style: TextStyle(
                                          fontSize: FontSizeManager.s12,
                                          fontFamily: FontFamily.pixelSansSerif,
                                        ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    PatientsSituation.patientsSituation2Desc,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s8,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                        ],
                      )),
                      Flexible(
                          child: ListView(
                        children: const [
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text(PatientsSituation.patientsSituation3,
                                        style: TextStyle(
                                          fontSize: FontSizeManager.s12,
                                          fontFamily: FontFamily.pixelSansSerif,
                                        ))),
                          ),
                          Card(
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    PatientsSituation.patientsSituation3Desc,
                                    style: TextStyle(
                                      fontSize: FontSizeManager.s8,
                                      fontFamily: FontFamily.pixelSansSerif,
                                    ))),
                          ),
                        ],
                      )),
                    ],
                  )),
                  ContactView(
                    playerBagController: playerBagController,
                    game: game,
                  ),
                  SafeArea(
                      child: Column(
                    children: [
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("collection d'apprentissage",
                                style: TextStyle(
                                  fontSize: FontSizeManager.s22,
                                  fontFamily: FontFamily.pixelSansSerif,
                                )),
                          )
                        ],
                      ),
                      Flexible(
                          child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Opacity(
                                opacity:
                                    game.badgeDiabeteTypeUnlocked ? 1 : 0.3,
                                child: Image.asset(
                                    "assets/images/badges/typeDiabete.png",
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Opacity(
                                opacity: game.badgeDiabeteComplicationUnlocked
                                    ? 1
                                    : 0.3,
                                child: Image.asset(
                                    "assets/images/badges/complicationDiabete.png",
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  )),
                  NotesView(game: game),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  _showMeasureToolDialog(MeasureToolModel measureTool) {
    gameScenesController.bagController.closeBag();
    gameScenesController.measureToolController
        .toolsUsageTrackers[measureTool.indexTracker!] = true;
    measureTool.isUsable = false;
    if (_isAllToolsUsed() == 0) {
      gameScenesController.measureToolController.toolsUsageTrackers = [];
      Future.delayed(
          const Duration(milliseconds: 400),
          () => gameScenesController.gameDialogController.onDialogList(
              [measureTool.toolDialog!, ...measureTool.nextDialogs!]));
    } else {
      Future.delayed(
        const Duration(milliseconds: 400),
        () => gameScenesController.gameDialogController.onDialogList([
          measureTool.toolDialog!,
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Il vous reste ${_isAllToolsUsed()} mesures à effectuer !")
        ]),
      );
    }
  }

  int _isAllToolsUsed() =>
      gameScenesController.measureToolController.toolsUsageTrackers
          .where((element) => element == false)
          .toList()
          .length;

  _showToolDefaultDialog(MeasureToolModel measureTool) {
    gameScenesController.bagController.closeBag();
    Future.delayed(
      const Duration(milliseconds: 400),
      () => gameScenesController.gameDialogController.onDialog(
        DialogModel(
          isShowDialog: true,
          dialogMessage: measureTool.defaultDialog,
        ),
      ),
    );
  }
}
