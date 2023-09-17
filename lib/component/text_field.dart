import 'package:flutter/material.dart';
class password_field extends StatefulWidget {
  final controler;
  final String hintText;
  final bool obsecure;
 final IconData ic;

  password_field({super.key,
  required this.controler,
    required this.hintText,
    required this.obsecure,
    required this.ic,

  });

  @override
  State<password_field> createState() => _myTextFieldState();

}

class _myTextFieldState extends State<password_field> {
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
    autocorrect: false,
    enableSuggestions: false,
    autofocus: false,

    decoration:InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(passwordVisible
            ? Icons.visibility
            : Icons.visibility_off,
        color:Colors.grey.shade500 ,),
        onPressed: () {
                  _toogleevisibility();
            },
          ),




      prefixIcon: Icon(widget.ic,color: Colors.grey.shade500),
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(  color: Colors.grey.withOpacity(0.4), width: 0.5),

        borderRadius: BorderRadius.circular(30),

       ),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(  color: Colors.grey.withOpacity(0.4), width: 0.5),
    borderRadius: BorderRadius.circular(30),
  ),
  fillColor: Colors.indigo.withOpacity(0.1),
      alignLabelWithHint: false,



      filled: true,
      hintText:widget.hintText,
      hintStyle:TextStyle(fontSize: 18, color: Colors.grey.shade500, fontStyle: FontStyle.normal),
  ),
    keyboardType: TextInputType.visiblePassword,
    textInputAction: TextInputAction.done,
  ),
    );
}
}