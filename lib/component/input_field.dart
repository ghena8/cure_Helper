
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final dynamic title; // Can be either a String or an int
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
     // String displayedTitle = title.toString(); // Convert the title to a String for display

    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Container(
            height: 48,
            margin: const EdgeInsets.only(top:6.0),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(
                    color:  Theme.of(context).colorScheme.secondary, width: 1.5 //Thickness of the rectangle
                    ),
                borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true, //If it was a widget, he wouldn't be able to write
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                      focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:  Theme.of(context).colorScheme.background,
                          width: 0
                        ),
                      ),
                      enabledBorder:    UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:  Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                ),
                widget==null?Container():Container(child: widget,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
