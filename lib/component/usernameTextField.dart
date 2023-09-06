import 'package:flutter/material.dart';
       
      class userNameField extends StatelessWidget {
        final controler;
        final String hintText;
        final IconData ic;
        const userNameField({
          super.key, this.controler, required this.hintText, required this.ic

        });
      
        @override
        Widget build(BuildContext context) {
          return  Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0 ),
          child: TextField(
          controller:controler,
          decoration:InputDecoration(
          prefixIcon: Icon(ic),

          enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color:Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          alignLabelWithHint: false,

          filled: true,
          hintText:hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          ),
          ),
          );
          }
      }
