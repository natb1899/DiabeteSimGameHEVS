import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriousgame/z_globals/z8_font_manager.dart';

/// this is the general widget for all pop up dialogue
Future showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) {
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
      content: Text(
        content,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontFamily: FontFamily.pixelSansSerif,
        ),
      ),
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
            onPressed: () => Navigator.of(context).pop(false),
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
  required Exception exception,
}) =>
    showAlertDialog(
      context,
      title: title,
      content: _message(exception),
      defaultActionText: 'OK',
    );

String _message(Exception exception) {
  return exception.toString();
}
