import 'package:flutter/material.dart';
import 'package:CureHelper/component/cure_button.dart';
import 'package:CureHelper/component/cure_text_field.dart';
import 'package:CureHelper/screens/sign_up.dart';
import 'package:flutter/material.dart';


class fogotPassword extends StatefulWidget {
  static const String routename = 'send email';

  const fogotPassword({super.key});

  @override
  State<fogotPassword> createState() => _fogotPasswordState();
}

class _fogotPasswordState extends State<fogotPassword> {
  @override
  final email = TextEditingController();

  void send() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.indigo,

        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
      const SizedBox(
        child:Text("Forgot Password? ",
                    textAlign: TextAlign.left ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:20,
                        fontWeight: FontWeight.w500
                    ),
                  ),

         ),

              Container(
        height: MediaQuery.of(context).size.height *
            0.7, // 70% of screen height
        width: double.infinity,

            alignment: Alignment.center,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(25)),
            ),
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 25.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


                     const SizedBox(child:
                      Text("Enter your registed email and we will send you a password reset link ",
                       textAlign: TextAlign.center ,
                    style: TextStyle(
                      color: Colors.indigo,
                        fontSize:20,
                        fontWeight: FontWeight.w500
                      ),
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
                    variants: "dark",
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
