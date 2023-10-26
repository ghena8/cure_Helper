//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/home.dart';

class HistoryPage extends StatefulWidget {
  static const String routename = 'history';
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNavigationBar(),
      //appBar: _appBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(63, 81, 181, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        //  const Text("",  // title to the page
                        //     textAlign: TextAlign.left ,
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize:22,
                        //         fontWeight: FontWeight.w700
                        //     ),
                        //   ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.75, // 70% of screen height
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),

              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  // start from here BODY
                  child: Center(child: Text("history page "))),
            ),
          ],
        ),
      ),
    );
  }

  myNavigationBar() {
    int _selectedIndex = 2;
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black, // of text
          activeColor: Colors.black,
          tabBackgroundColor: const Color.fromRGBO(63, 81, 181, 0.76),
          gap: 8, //Space between the icon and the name
          padding: const EdgeInsets.all(16),
          onTabChange: _navigateBottomBar, // Change under pressure
          selectedIndex: _selectedIndex,
          tabs: [
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(homePage.routename);
              },
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(searchPage.routename);
              },
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HistoryPage.routename);
              },
              icon: Icons.auto_stories, // or collections_bookmark or menu_book
              text: 'History',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(morePage.routename);
              },
              icon: Icons.more_horiz_outlined,
              text: 'more',
            ),
          ],
        ),
      ),
    );
  }
}
