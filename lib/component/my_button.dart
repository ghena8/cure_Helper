import 'package:flutter/material.dart';
class button extends StatelessWidget {
  final Function()? onTab;
  final String  text;
  const button({super.key,required this.onTab,  required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTab ,
      child:Container(
     padding:const EdgeInsets.all(25.0),
     margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(color: Colors.black,
      borderRadius: BorderRadius.circular(8),
    ),
      child:  Center(
          // Navigate to the second screen using a named route.

      child: Text(text,
      style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      ),

        ),

      ),
    );
  }
}
