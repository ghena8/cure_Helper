import 'package:CureHelper/component/alert.dart';
import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:CureHelper/screens/login_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  static const String routename = 'signup';

  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final username = TextEditingController(text: "");

  final password = TextEditingController(text: "");

  final email = TextEditingController(text: "");

  signUp() async {
    try {
      showLoading(context);

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("Password is too weak"),
        ).show();
      } else if (e.code == 'email-already-in-use') {
        /**
         * - CHECK IF USER EXSITIED
         * if exsits, throw an error
         * else continue signup
         *  */
        Navigator.of(context).pop();
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("The account already exists for that email"),
        ).show();
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  void signUpUser() async {
    // button
    /**

     * - check if user is in the collection
     * - if true, update the collection
     * else add new user to the collection
     */
    UserCredential response = await signUp();
    print("===================");
    await FirebaseFirestore.instance
        .collection("users")
        .add({"username": username.text,
      "email": response.user?.email,
      "bio":"Empty bio.."});
    Navigator.of(context).pushReplacementNamed(loginPage.routename);
    print("===================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(25)),
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
                          // variants: "dark",
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
                                Navigator.of(context)
                                    .pushNamed(loginPage.routename);
                              },
                              child: Text(
                                "Log in here",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
