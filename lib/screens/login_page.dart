import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:CureHelper/screens/sign_up.dart';
import 'package:CureHelper/screens/forgotPassword.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  static const String routename = 'login';

  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final username = TextEditingController();

  final password = TextEditingController();
  void LogInUser() {}

  @override
  Widget build(BuildContext context) {
    // double sizeW= MediaQuery.of(context).size.width; if I wanted streched dimensions
    // double sizeH = MediaQuery.of(context).size.height;if I wanted streched dimensions
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.indigo,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.7, // 70% of screen height
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
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
                    controler: username,
                    hintText: "username",
                    ic: Icons.person,
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
                        Navigator.of(context).pushNamed(fogotPassword.routename);
                      },
                        child:  Text(
                        "forgot password?",
                        style: TextStyle(
                          color: Colors.indigo[600],
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ],
                  ),
                  CureButton(
                    onTab: LogInUser,
                    text: "Log In",
                    variants: "dark",
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
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.indigo,
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