import 'package:flutter/material.dart';
import 'package:CureHelper/screens/morePage.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    " P R P F I L E",
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

    ),
  ]),
    ),
    );
  }
}
