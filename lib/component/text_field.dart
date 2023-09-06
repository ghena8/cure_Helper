import 'package:flutter/material.dart';
class myTextField extends StatefulWidget {
  final controler;
  final String hintText;
  final bool obsecure;
 final IconData ic;

   myTextField({super.key,
  required this.controler,
    required this.hintText,
    required this.obsecure,
    required this.ic,

  });

  @override
  State<myTextField> createState() => _myTextFieldState();

}

class _myTextFieldState extends State<myTextField> {
  bool passwordVisible=false;

  @override
  void _toogleevisibility(){
    setState((){
      passwordVisible= !passwordVisible;

    });

  }
  Widget build(BuildContext context) {
    return  Padding(
  padding: const EdgeInsets.symmetric(horizontal:25.0 ),
  child: TextField(
    controller: widget.controler,
    obscureText: !passwordVisible,


    decoration:InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(passwordVisible
            ? Icons.visibility
            : Icons.visibility_off),
        onPressed: () {
                  _toogleevisibility();
            },
          ),




      prefixIcon: Icon(widget.ic),

      enabledBorder:  OutlineInputBorder(
  borderSide: BorderSide(color:Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(color:Colors.grey.shade200),
  ),
  fillColor: Colors.white70,
      alignLabelWithHint: false,

      filled: true,
      hintText:widget.hintText,
      hintStyle: TextStyle(color: Colors.grey[500]),
  ),
    keyboardType: TextInputType.visiblePassword,
    textInputAction: TextInputAction.done,
  ),
    );
}
}