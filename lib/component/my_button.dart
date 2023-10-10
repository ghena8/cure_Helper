import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Function()? onTab;
  final String text;
  const button({super.key, required this.onTab, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 50,
        // padding: const EdgeInsets.all(25.0), // this padding is causing the problem
        //margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          widthFactor: 1.5, // speace to the text 
          // Navigate to the second screen using a named route.
          child: Text(
            text,
            style: const TextStyle(
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
