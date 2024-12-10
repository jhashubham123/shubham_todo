import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskComplete;
  final Function(bool?)? onChanged;
  final Function()? onTap;
  const TodoTile({
    super.key,
    required this.taskName,
    required this.isTaskComplete,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            /// Status checkbox
            Checkbox(
                activeColor: Colors.black,
                value: isTaskComplete,
                onChanged: onChanged),

            /// Task title
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isTaskComplete ? FontWeight.bold : FontWeight.w500,
                    decoration: isTaskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),

            /// Delete button
            GestureDetector(onTap: onTap, child: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
