import 'package:flutter/material.dart';
class cure_text_field extends StatefulWidget {
  final controler;
  final String hintText;
  final bool obsecure;
 final IconData ic;

  cure_text_field({super.key,
  required this.controler,
    required this.hintText,
    required this.obsecure,
    required this.ic,

  });

  @override
  State<cure_text_field> createState() => _myTextFieldState();

}

class _myTextFieldState extends State<cure_text_field> {
  bool passwordVisible=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible= !widget.obsecure;
  }

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
    obscureText:
    !passwordVisible,
    autocorrect: false,
    enableSuggestions: false,
    autofocus: false,

    decoration:InputDecoration(




      prefixIcon: Icon(widget.ic,color: Colors.grey.shade500),
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(  color: Colors.grey.withOpacity(0.4), width: 0.5),

        borderRadius: BorderRadius.circular(30),

       ),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(  color: Colors.grey.withOpacity(0.4), width: 0.5),
    borderRadius: BorderRadius.circular(30),
  ),
  fillColor: Theme.of(context).colorScheme.secondary,

    alignLabelWithHint: false,



      filled: true,
      hintText:widget.hintText,
      hintStyle:TextStyle(fontSize: 18, color: Colors.grey.shade500, fontStyle: FontStyle.normal),
      suffixIcon:
      widget.obsecure ?
      IconButton(
        icon: Icon(passwordVisible
            ? Icons.visibility
            : Icons.visibility_off,
            color:Colors.grey.shade500 ),
        onPressed: () {
          _toogleevisibility();
        },
      ): null,
    ),
    keyboardType: TextInputType.visiblePassword,
    textInputAction: TextInputAction.done,
    ),


    );
}
}