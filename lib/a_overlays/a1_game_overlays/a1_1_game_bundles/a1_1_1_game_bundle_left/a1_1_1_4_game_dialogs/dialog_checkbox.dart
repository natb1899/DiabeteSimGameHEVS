import 'package:flutter/material.dart';

import 'dialog_controller.dart';

/// this class allows to display checkboxs as dialog
class DialogCheckbox extends StatefulWidget {
  final GameDialogController gameDialogController;
  final int questionIndex;
  const DialogCheckbox(
      {required this.gameDialogController,
      required this.questionIndex,
      super.key});

  @override
  State<DialogCheckbox> createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool isChecked = false;
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

    return Checkbox(
      checkColor: Colors.deepOrange,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: widget.gameDialogController.answersTracker[widget.questionIndex],
      onChanged: (bool? value) {
        setState(() {
          widget.gameDialogController.answersTracker[widget.questionIndex] =
              value!;
        });
      },
    );
  }
}
