import 'package:flutter/material.dart';

import '../../../d_game_scenes/game_base.dart';
import '../../../z_globals/z8_font_manager.dart';

/// Widget to display the tab notes in the bag
class NotesView extends StatelessWidget {
  final DiabeteGameBase game;

  const NotesView({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: game.gameScenesController.notesController.notes.length,
      child: Scaffold(
          appBar: AppBar(
              flexibleSpace: TabBar(
            tabs: [
              ...(game.gameScenesController.notesController.notes.values
                  .map((noteModel) => Tab(text: noteModel.character))
                  .toList())
            ],
          )),
          body: TabBarView(children: [
            ...(game.gameScenesController.notesController.notes.values
                .map(
                    (noteModel) => CustomTabContent(notesList: noteModel.notes))
                .toList())
          ])),
    );
  }
}

class CustomTabContent extends StatelessWidget {
  final List<String> notesList;

  const CustomTabContent({super.key, required this.notesList});

  @override
  Widget build(BuildContext context) {
    if (notesList.isEmpty) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Aucune note',
            style: TextStyle(
                fontSize: FontSizeManager.s14,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.pixelSansSerif),
          ));
    }

    return ListView(
      children: notesList.asMap().entries.map((note) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Note ${note.key + 1}',
                  style: const TextStyle(
                      fontSize: FontSizeManager.s14,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.pixelSansSerif),
                )),
            Card(
              elevation: 2.0,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note.value,
                    style: const TextStyle(
                        fontSize: FontSizeManager.s12,
                        fontFamily: FontFamily.pixelSansSerif),
                  )),
            ),
          ],
        );
      }).toList(),
    );
  }
}
