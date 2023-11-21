import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:CureHelper/screens/welcome.dart';
import '../component/cure_button.dart';

class morePage extends StatefulWidget {
  static const String routename = 'more';
  const morePage({super.key});

  @override
  State<morePage> createState() => _morePageState();
}

class _morePageState extends State<morePage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNavigationBar(),
      //appBar: _appBar(),
      body: Container(
        decoration:  BoxDecoration(
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
                          Icon(
                            Icons.settings,
                            size: 40,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            " S E T T I N G ",
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
                  0.70, // 70% of screen height
              width: double.infinity,
              decoration:BoxDecoration(
                color: Theme.of(context).colorScheme.background,

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                // start from here BODY
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),

                          //profile
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: ListTile(
                              leading: Icon(
                                Icons.account_circle,
                                color: Colors.grey[400],
                                size: 40,
                              ),
                              title: const Text(
                                " P R O F I L E ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onTap: () {
                                // go to profile screen
                              },
                            ),
                          ),
                        ],
                      ),
                      CureButton(
                        onTab: () {
                          Provider.of<ThemeProvider> (context,listen:false).toggleTheme();// go to home page
                        },
                        text: " mode",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(welcome.routename);
                            // go to welcome screen
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout_rounded,
                              color: Colors.grey[400],
                              size: 40,
                            ),
                            title: const Text(
                              " L O G O U T ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //log out
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  myNavigationBar() {
    int _selectedIndex = 3;
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.onBackground, // of text
          activeColor: Theme.of(context).colorScheme.onBackground,
          tabBackgroundColor:Theme.of(context).colorScheme.primary,

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
