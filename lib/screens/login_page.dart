import 'package:CureHelper/component/alert.dart';
import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:CureHelper/screens/forgotPassword.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/screens/sign_up.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  static const String routename = 'login';

  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final email = TextEditingController(text: "");

  final password = TextEditingController(text: "");

  signIn() async {
    try {
      showLoading(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        AwesomeDialog(
                context: context,
                title: "Error",
                body: Text("No user found for that email"))
            .show();
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        AwesomeDialog(
                context: context,
                title: "Error",
                body: Text("Wrong password provided for that user"))
            .show();
      }
    }
  }

  void logInUser() async {
    var user = await signIn();
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, homePage.routename, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // double sizeW= MediaQuery.of(context).size.width; if I wanted streched dimensions
    // double sizeH = MediaQuery.of(context).size.height;if I wanted streched dimensions
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.75, // 75% of screen height
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  cure_text_field(
                    obsecure: false,
                    controler: email,
                    hintText: "email",
                    ic: Icons.email,
                  ),
                  cure_text_field(
                    controler: password,
                    hintText: "password",
                    obsecure: true,
                    ic: Icons.lock,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(fogotPassword.routename);
                        },
                        child: Text(
                          "forgot password?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CureButton(
                    onTab: logInUser,
                    // go to home page

                    text: "Log In",
                    // variants: "dark",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("not a member? "),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(signUp.routename);
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
