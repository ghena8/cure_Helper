import 'package:Login/login_page.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:Login/component/start_button.dart';
import 'package:Login/component/my_button.dart';
class welcome extends StatelessWidget {
const welcome({super.key});



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        gradient:
        LinearGradient(
          colors: [
            Color(0xff3f51b5),
            Color(0xff1a237e),
        ],
       begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops:[0.0, 1.8],
          tileMode: TileMode.clamp),

        ),
          child: Center(
            child: Stack(
              children:[
              Positioned(
              bottom: 300,
              left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/Untitled-removebg-preview.png",
                   width: 250,
                    ),
                   const Text("   Cure Helper",style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,

                    ),)
                  ],
                ),
              ),
              Positioned(
                  bottom: 100,
                  left: 110,
                  right: 0,
                  
                  child: Row(
                  children:[
                    start_button(onTab:(){Navigator.of(context).pushNamed("login");}, text: "Get started",),
                  ],
                ),


                  ),

          ]  ),
    ),

        ),
        );
  }
}
