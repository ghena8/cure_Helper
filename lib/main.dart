//import 'package:CureHelper/db/db_helper.dart';
import 'package:CureHelper/firebase_options.dart';
import 'package:CureHelper/providers/user_provider.dart';
import 'package:CureHelper/screens/addPage.dart';
import 'package:CureHelper/screens/forgotPassword.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/profile_page.dart';
import 'screens/login_page.dart';
import 'screens/sign_up.dart';
import 'screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
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
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      Provider.of<UserProvider>(context, listen: false).setUser(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user == null ? const welcome() : const homePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        "welcome": (BuildContext context) => const welcome(),
        "login": (context) => const loginPage(),
        "signup": (context) => const signUp(),
        "send email": (context) => const fogotPassword(),
        "home": (context) => const homePage(),
        "add medicine ": (context) => const AddMedicinePage(),
        "more": (context) => const morePage(),
        "search": (context) => const searchPage(),
        "history": (context) => const HistoryPage(),
        "profile": (context)=> const ProfilePage(),
      },
    );
  }
}
