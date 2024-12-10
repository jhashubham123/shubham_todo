import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  const DialogButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow,
      child: Text(buttonText),
    );
  }
}
