import 'package:flutter/material.dart';

import '../../../../../z_globals/z8_font_manager.dart';
import 'dialog_controller.dart';

/// this class allows to display radiobutton as dialog
class DialogRadioButton extends StatefulWidget {
  final GameDialogController gameDialogController;
  final List<Map<String, dynamic>> answers;
  const DialogRadioButton(
      {required this.gameDialogController, required this.answers, super.key});

  @override
  State<DialogRadioButton> createState() => _DialogRadioButton();
}

class _DialogRadioButton extends State<DialogRadioButton> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.brown;
    }

    return Column(
      children: widget.answers.asMap().entries.map((answer) {
        return Row(
          children: [
            Radio<String>(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: answer.value["answer"],
              groupValue: widget.gameDialogController.radioAnswer,
              onChanged: (String? value) {
                setState(() {
                  widget.gameDialogController.radioAnswer = value!;
                });
              },
            ),
            Text(
              answer.value["answer"],
              style: const TextStyle(
                fontSize: FontSizeManager.s12,
                fontFamily: FontFamily.pixelSansSerif,
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
