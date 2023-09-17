import 'package:flutter/material.dart';

class start_button extends StatelessWidget {
  final Function()? onTab;
  final String text;
  const start_button({super.key, required this.onTab, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 50,
        width: 200,
        // padding: const EdgeInsets.all(40.0), // this padding is causing the problem
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          // Navigate to the second screen using a named route.
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
