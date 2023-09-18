import 'package:flutter/material.dart';

class text_field extends StatelessWidget {
  final controler;
  final String hintText;
  final IconData ic;
  const text_field(
      {super.key, this.controler, required this.hintText, required this.ic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controler,
        autocorrect: false,
        enableSuggestions: false,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(ic, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: Colors.indigo.withOpacity(0.1),
          alignLabelWithHint: false,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade500,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}
