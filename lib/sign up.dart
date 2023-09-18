import 'package:Login/component/cure_button.dart';
import 'package:Login/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:Login/component/usernameTextField.dart';
import 'component/text_field.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final username = TextEditingController();

  final password = TextEditingController();

  final email = TextEditingController();
  void signUpUser() {}

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  text_field(
                    controler: username,
                    hintText: "username",
                    ic: Icons.person,
                  ),
                  // SizedBox(height:10),

                  password_field(
                    controler: password,
                    hintText: "password",
                    obsecure: true,
                    ic: Icons.lock,
                  ),

                  // an email field
                  text_field(
                    controler: email,
                    hintText: "email",
                    ic: Icons.email,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "forgot password?",
                          style: TextStyle(
                            color: Colors.indigo[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //   SizedBox(height:10),
                  //sign in button

                  CureButton(
                    onTab: signUpUser,
                    text: "sign up",
                    variants: "dark",
                  ),

                  //  const SizedBox(height:10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("do you have an account? "),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("login");
                        },
                        child: const Text(
                          "Log in here",
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
