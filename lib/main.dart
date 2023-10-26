//import 'package:CureHelper/db/db_helper.dart';
import 'package:CureHelper/screens/addPage.dart';
import 'package:CureHelper/screens/forgotPassword.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await DBHelper.initDb();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const welcome(),
      initialRoute: "welcome",
      routes: {
        "welcome": (BuildContext context) => const welcome(),
        "login": (context) => const loginPage(),
        "signup": (context) => const signUp(),
        "send email": (context) => const fogotPassword(),
        "home" :(context) => const homePage(),
        "add medicine " :(context) => const AddMedicinePage(),
        "more" :(context) => const morePage(),
        "search" :(context) => const searchPage(),
        "history" :(context) => const HistoryPage(),

      },
    );
  }
}
