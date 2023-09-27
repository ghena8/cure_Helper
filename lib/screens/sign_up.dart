import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:CureHelper/screens/login_page.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  static const String routename = 'signup';

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
                  topLeft: Radius.circular(15), topRight: Radius.circular(25)
              ),


            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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

                  // an email field
                  cure_text_field(
                    obsecure: false,

                    controler: email,
                    hintText: "email",
                    ic: Icons.email,
                  ),


                  CureButton(
                    onTab: signUpUser,
                    text: "sign up",
                    variants: "dark",
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("do you have an account? "),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(loginPage.routename);
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
