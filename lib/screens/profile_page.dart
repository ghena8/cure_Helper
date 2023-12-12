import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../component/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //user
    final currentUser = FirebaseAuth.instance.currentUser;
//edit field
    Future<void> editField(String field) async {


      String newValue = "";
      await showDialog(
      context: context,

      builder: (context) => AlertDialog(
      backgroundColor:Colors.grey[900],
      title: Text(
      "Edit $field",
      style: const TextStyle(color:Colors.white),
      ), // Text
      content: TextField(
      autofocus: true,

      decoration: InputDecoration(
      hintText: "Enter new $field",
      hintStyle: TextStyle(color: Colors.grey),
      ),
        onChanged: (value){
        newValue =value;
        }

      ),  // InputDecoration
      ), // TextField
      ); // AlertDialog
    }
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
    " P R P O I L E",
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.grey[300],
    ),
    ),
    const SizedBox(width: 20,),
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

         child: ListView(
            children: [
              SizedBox(height: 50),


              Icon(
                Icons.person,
                color: Colors.grey[400],
                size: 72,
              ),
              SizedBox(height: 10),
              Text(
                currentUser?.email ?? 'N/A',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),


              SizedBox(height: 50),
              //user details
              Padding(
                  padding:EdgeInsets.only(left:25.0),
                  child: Text(
                    "My Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,

                      fontSize: 15,

                    ),
                  )
              ),
              //username
              MyTextBox(
                text:'Ghena Alghalayeeni' ,
                sectionName: 'username',
                onPressed:() => editField('username'),
              ),
              SizedBox(height:30 ),
              //bio
              MyTextBox(
                text:'empty bio' ,
                sectionName: 'bio',
                onPressed:() => editField('bio'),
              ),
            ],
          ),


    ),

    ],),
    ),
    );

  }
}
