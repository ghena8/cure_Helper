import 'package:Login/component/my_button.dart';
import 'package:Login/component/square_title.dart';
import 'package:flutter/material.dart';
import 'package:Login/component/usernameTextField.dart';
import 'component/text_field.dart';
import 'package:Login/welcome.dart';
class loginPage extends StatefulWidget {
   const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
final username = TextEditingController();

final password =  TextEditingController();
void LogInUser(){}

@override
  Widget  build(BuildContext context) {
 // double sizeW= MediaQuery.of(context).size.width; if I wanted streched dimensions
 // double sizeH = MediaQuery.of(context).size.height;if I wanted streched dimensions
    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
           color: Colors.indigo,
              /* an image for background
              alignment: Alignment.topCenter,
              fit: BoxFit.fill,
              image:AssetImage("assets/photo_2023-09-08_18-59-27.jpg"
            ),
            ),*/
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
  Container(
  height: 700,
  width: double.infinity,
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(25)),
  ),
  child: Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.stretch,

  children: [
    SizedBox(height: 40),



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
          //forgot password?
         // SizedBox(height:20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(

              mainAxisAlignment:MainAxisAlignment.center,
              children: [

                Text("forgot password?",
                style: TextStyle(
                  color: Colors.indigo[600],fontSize: 15,fontWeight: FontWeight.w400,
                ),
                ),

              ],
            ),
          ),

       //   SizedBox(height:10),
          //sign in button

          button(onTab: LogInUser,text: "Log In",),

        //  const SizedBox(height:10),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("not a member? "),
            SizedBox(width: 4,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("signup");

              },
              child:Text("Register now", style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.w500), ),),

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
