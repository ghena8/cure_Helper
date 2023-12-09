import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:flutter/material.dart';

class fogotPassword extends StatefulWidget {
  static const String routename = 'send email';

  const fogotPassword({super.key});

  @override
  State<fogotPassword> createState() => _fogotPasswordState();
}

class _fogotPasswordState extends State<fogotPassword> {
  @override
  final email = TextEditingController(text: "");

  void send() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 40,
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              " Reset Password",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height *
                    0.80, // 80% of screen height
                width: double.infinity,

                alignment: Alignment.center,

                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        child: Text(
                          "Enter your registed email and we will send you a password reset link ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 60),
                      cure_text_field(
                        obsecure: false,
                        controler: email,
                        hintText: "email",
                        ic: Icons.email,
                      ),
                      SizedBox(height: 20),
                      CureButton(
                        onTab: send,
                        text: "Send",
                        //   variants: "dark",
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
