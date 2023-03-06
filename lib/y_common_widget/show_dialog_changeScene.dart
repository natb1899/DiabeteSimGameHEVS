import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/z_globals/z8_font_manager.dart';

/// this is the general widget for all pop up dialogue
Future showChangeSceneDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String imageUrl,
  String? cancelActionText,
  required String defaultActionText,
  required GameScenesController gameScenesController,
  required String nextScene,
}) {
  //print(content);
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: FontFamily.pixelSansSerif,
          color: Colors.brown,
          fontSize: 14,
        ),
      ),
      content: Column(children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.fill,
          height: 200,
          //width: 400,
        ),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontFamily: FontFamily.pixelSansSerif,
            color: Colors.brown,
            fontSize: 14,
          ),
        ),
      ]),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(
              cancelActionText,
              style: const TextStyle(
                fontFamily: FontFamily.pixelSansSerif,
                color: Colors.deepOrange,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        CupertinoDialogAction(
          child: Text(
            defaultActionText,
            style: const TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
              color: Colors.deepOrange,
            ),
          ),
          onPressed: () {
            gameScenesController.goToScene(nextScene);
            Navigator.of(context).pop(true);
          },
        ),
      ],
    ),
  );
}

Future<void> showExceptionAlertDialog(
  BuildContext context, {
  required String title,
  required String imageUrl,
  required Exception exception,
  required GameScenesController gameScenesController,
  required String nextScene,
}) =>
    showChangeSceneDialog(context,
        title: title,
        imageUrl: imageUrl,
        content: _message(exception),
        defaultActionText: 'OK',
        gameScenesController: gameScenesController,
        nextScene: nextScene);

String _message(Exception exception) {
  return exception.toString();
}
