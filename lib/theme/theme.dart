
import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
brightness: Brightness.light,
colorScheme: ColorScheme.light(
background: Colors.white,
  primary: Color(0xff3f51b5),

    secondary: Colors.indigo.withOpacity(0.1),
  onBackground: Colors.black

),
  /*textTheme: TextTheme(
    bodyText1: TextStyle(color:  Color(0xff3f51b5),),
  ),*/
);
ThemeData darkMode = ThemeData(
brightness: Brightness.dark,
  colorScheme: ColorScheme.dark (
  background: Colors.grey.shade800,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade300,
   onBackground:Colors.white,


  ),
  /*textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white,fontSize: 15,
      fontWeight: FontWeight.w400,),
  ),*/
);