import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class myNavigationBar extends StatelessWidget {
  const myNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black, // of text
            activeColor: Colors.black,
            tabBackgroundColor:Color.fromRGBO(63, 81, 181, 0.76),
            gap: 8, //Space between the icon and the name
            padding: EdgeInsets.all(16),
            // onTabChange: (){}, // Change under pressure
            tabs: [
              GButton(
                icon: Icons.settings,
                text: 'Setting',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon:
                    Icons.auto_stories, // or collections_bookmark or menu_book
                text: 'History',
              ),
            ],
          ),
        ),
      ); 
  }
}

