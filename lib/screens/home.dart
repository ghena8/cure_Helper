//import 'package:CureHelper/component/navigationBar.dart';
import 'package:CureHelper/screens/addPage.dart';
import 'package:CureHelper/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../component/cure_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/screens/morePage.dart';

class homePage extends StatefulWidget {
  static const String routename = "home";
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

final FirestoreService firestoreService = FirestoreService();

DateTime _selectedDate = DateTime.now();

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNavigationBar(),
      //appBar: _appBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
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
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                // start from here BODY
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _addMedicineBar(), // First row (day, date, and add button)
                    _addDateBar(), // Second row (date_timeline)
                    _readMedicine() // Thord item is a list that shows the medications that have been saved
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _readMedicine() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getNoteStream(),
      builder: (context, snapshot) {
        // if we have data, get all the docs
        if (snapshot.hasData) {
          List notesList = snapshot.data!.docs;

          // display as a list
          return Expanded(
            child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                // get each individual doc
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                // get note from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                // display as a list tile for UI
                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit or update medication data
                      IconButton(
                        onPressed: () {
                          // supposed to go to the add page and modify the data
                        },
                        icon: const Icon(Icons.edit),
                      ),

                      // delet button
                      IconButton(
                        onPressed: () => firestoreService.deletNote(docID),
                        icon: const Icon(Icons.task_alt),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        //if there is no data return nothing
        else {
          return const Text(" No Medicine .. ");
        }
      },
    );
  }

  _addMedicineBar() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(225, 158, 158, 158),
                ),
              ),
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          CureButton(
            onTab: () {
              Navigator.of(context)
                  .pushNamed(AddMedicinePage.routename); // go to add page
            },
            text: "     +     ",
            //variants: "dark",
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: DatePicker(
        DateTime.now(),
        height: 95,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Theme.of(context).colorScheme.primary,
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.grey,
        ),
        dayTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        ),
        monthTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  myNavigationBar() {
    int _selectedIndex = 0;
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.onBackground, // of text
          activeColor: Theme.of(context).colorScheme.onBackground,
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
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

// _appBar() {
//   return AppBar(
//     backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
//     leading: const //Make things just the beginning
//         Text(
//       "Hi Name",
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//         fontStyle: FontStyle.normal,
//       ),
//     ),
//   );
// }
