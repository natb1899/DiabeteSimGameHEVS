import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_4_game_dialogs/dialog_model.dart';

import '../../../d_game_scenes/game_base.dart';
import '../../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import '../../../z_globals/z8_font_manager.dart';
import 'contact_model.dart';

/// widjet of the list of professionals in the bag
class ContactView extends StatefulWidget {
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;

  const ContactView({
    Key? key,
    required this.game,
    required this.playerBagController,
  }) : super(key: key);

  @override
  State<ContactView> createState() => _ContactState();
}

class _ContactState extends State<ContactView> {
  // contains a list notifier if we add contact during the game
  late final List<Contact> contactList;
  late final ValueNotifier<List<Contact>> _contactList;

  /// When initializing the state, a listener is created on the notification board
  /// to change the interface when something changes.
  @override
  void initState() {
    super.initState();
    contactList =
        widget.game.gameScenesController.contactsController.contactList;
    _contactList = ValueNotifier(contactList);
    widget.game;
    widget.playerBagController;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Contact>>(
            valueListenable: _contactList,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {
                        widget.playerBagController.updateBagState();
                        widget.playerBagController.bagState
                            ? widget.game.pauseEngine()
                            : widget.game.resumeEngine();
                        // Run etape 4 of the situation 3 when you clic on emergency
                        if (contactList[index].isReachable!) {
                          Future.delayed(
                              const Duration(milliseconds: 500),
                              (() => widget.game.gameScenesController
                                  .gameDialogController
                                  .onDialogList(contactList[index].dialog!)));
                        } else {
                          widget.game.gameScenesController.gameDialogController
                              .onDialog(DialogModel(
                                  isShowDialog: true,
                                  dialogMessage:
                                      "Vous ne pouvez pas appeler maintenant"));
                        }
                      },
                      child: CustomCardContact(
                        contactIndex: index,
                        contactList: contactList,
                      ));
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}

/// widjet for each contact like a card
class CustomCardContact extends StatefulWidget {
  const CustomCardContact(
      {Key? key, required this.contactList, required this.contactIndex})
      : super(key: key);

  final int contactIndex;
  final List<Contact> contactList;

  @override
  State<CustomCardContact> createState() => _CustomCardContact();
}

class _CustomCardContact extends State<CustomCardContact> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        elevation: 4.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: widthScreen * 0.05,
              height: 70,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/contacts/${widget.contactList[widget.contactIndex].image}"),
                backgroundColor: Colors.transparent,
              )),
          SizedBox(
              width: widthScreen * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.contactList[widget.contactIndex].name,
                      style: const TextStyle(
                          fontSize: FontSizeManager.s14,
                          fontFamily: FontFamily.pixelSansSerif,
                          color: Colors.blueGrey)),
                  Text(widget.contactList[widget.contactIndex].phoneNumber,
                      style: const TextStyle(
                        fontSize: FontSizeManager.s12,
                        fontFamily: FontFamily.pixelSansSerif,
                      )),
                ],
              )),
        ]));
  }
}
