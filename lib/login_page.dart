import 'package:Login/component/my_button.dart';
import 'package:Login/component/square_title.dart';
import 'package:flutter/material.dart';
import 'package:Login/component/usernameTextField.dart';
import 'component/text_field.dart';
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
  double sizeW= MediaQuery.of(context).size.width;
  double sizeH = MediaQuery.of(context).size.height;
    return Scaffold(

        backgroundColor: Colors.white,

      body: SafeArea(
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // logo
        const   SizedBox(height:50),
            const Image(
            height:180,
              width: 180,
               image:AssetImage("assets/Untitled333-removebg-preview.png"
              ),
          ),
          SizedBox(height:15),

          //welcome back!, you've been missed.
          Text("welcome back!, you've been missed.",
            style: TextStyle
              (
                color: Colors.grey[700]
                , fontSize: 20),
          ),
          SizedBox(height:25),

          userNameField(
              controler: username,
          hintText: "username",
            ic: Icons.person,

          ),
          SizedBox(height:10),

          myTextField(
          controler: password,
            hintText: "password",
            obsecure: true,
            ic: Icons.lock,

          ),
          //forgot password?
          SizedBox(height:10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(

              mainAxisAlignment:MainAxisAlignment.end,
              children: [

                Text("forgot password?",
                style: TextStyle(
                  color: Colors.grey[600],fontSize: 15,
                ),
                ),

              ],
            ),
          ),

          SizedBox(height:25),
          //sign in button

          button(onTab: LogInUser,text: "Log In",),

          const SizedBox(height:50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(children: [
              Expanded(child:Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("or continue with",
                style:TextStyle(color: Colors.grey[700],),
              ),
              ),
              Expanded(
                  child:Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              )
              )


            ],),
          ),
            SizedBox(height: 30,),
         /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          square_title(imagePath: "assets/google-logo-9808.png"),
          const  SizedBox(width: 10,),
          square_title(imagePath: "assets/png-apple-logo-9711.png")
          ],),
          SizedBox(height: 30,),
*/
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("not a member? "),
            SizedBox(width: 4,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("signup");

              },
              child:Text("Register now", style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold), ),),

          ],
        )
        ],
        ),
      )
      )
    );
  }
}
