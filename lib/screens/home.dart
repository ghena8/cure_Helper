import 'package:CureHelper/component/navigationBar.dart';
import 'package:flutter/material.dart';


class homePage extends StatefulWidget {
  static const String routename = 'home';
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const myNavigationBar(),
     
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.indigo,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *
                  0.7, // 70% of screen height
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
