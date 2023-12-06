import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  @override
  _MyIconButtonState createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      icon: Icon(
        Icons.task_alt,
        size: 28,
        color: isPressed ? Colors.white : null,
      ),
    );
  }
}