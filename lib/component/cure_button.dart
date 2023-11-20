import 'package:flutter/material.dart';

const Map<String, Map<String, Color>> colors = {
  "light": {
    "background": Colors.white,
    "text": Color(0xff3f51b5),
  },
  "dark": {
    "background": Color(0xff3f51b5),
    "text": Colors.white,
  },
};

class CureButton extends StatelessWidget {
  final Function()? onTab;
  final String text;
  final String variants;
  const CureButton({
    super.key,
    required this.onTab,
    required this.text,
    this.variants = "light",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          // Navigate to the second screen using a named route.
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
