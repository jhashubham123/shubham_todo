import 'package:flutter/material.dart';
import 'package:todo/utils/dialo_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// user input to add task
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
            ),

            /// Buttons for saving and cancelling data
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// Save button
                DialogButton(buttonText: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),

                /// Cancel button
                DialogButton(buttonText: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
