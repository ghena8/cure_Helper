import 'package:Login/welcome.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign up.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
debugShowCheckedModeBanner: false,
      home:welcome(),
      initialRoute:  "welcome",
      routes:
      {
        "welcome":(BuildContext context) => welcome(),
        "login":(context) => loginPage(),
        "signup":(context) => signUp(),
      },

      );


  }
}

