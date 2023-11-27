//import 'package:CureHelper/db/db_helper.dart';
import 'package:CureHelper/firebase_options.dart';
import 'package:CureHelper/screens/addPage.dart';
import 'package:CureHelper/screens/forgotPassword.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/screens/moreMedicineData.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:CureHelper/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_page.dart';
import 'screens/welcome.dart';
import 'screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
  // await DBHelper.initDb();

  runApp(
ChangeNotifierProvider(create: (context) => ThemeProvider(),
child: const MyApp(),
  ),
  );
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
      theme: Provider.of<ThemeProvider>(context).themeData,
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
       // "moreMData"  :(context) => const moreMData(),
      },
    );
  }
}
