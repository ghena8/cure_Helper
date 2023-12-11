//import 'package:CureHelper/component/navigationBar.dart';
import 'package:CureHelper/component/mycheckIcon.dart';
import 'package:CureHelper/screens/addPage.dart';
import 'package:CureHelper/screens/moreMedicineData.dart';
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
                    _readMedicine(), // Thord item is a list that shows the medications that have been saved
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
        if (notesList.isEmpty){ 
          return Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconTheme(
                  data: IconThemeData(color: Colors.grey[400]),
                  child: const Icon(
                    Icons.library_books_sharp,
                    size: 90,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "You don't have any medications today.",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
          }
          // display as a list
          return Expanded(
            child: ListView.builder(
              itemCount: notesList.length,
              //separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['medicineName'];
                String condition = data['condition'];
                int duration = data['duration'];
               

                String repeat = data['repeat'];
                String startDate = data['startDate'];
                String endDate = calculateEndDate(duration, startDate);
                DateTime startDateTime =
                    DateFormat("M/d/yyyy").parse(startDate);
                DateTime endDateTime = DateFormat("M/d/yyyy").parse(endDate);

                int colorBack = data['color'];
                Color itemColor;
                if (colorBack == 0) {
                  itemColor = Colors.lightBlueAccent.withOpacity(0.7);
                } else if (colorBack == 1) {
                  itemColor = const Color(0xFFD53A6E).withOpacity(0.7);
                } else {
                  itemColor = const Color(0xFFB0F067).withOpacity(0.7);
                }

                if (startDateTime.isBefore(_selectedDate) &&
                        endDateTime.isAfter(_selectedDate) ||
                    startDate == DateFormat.yMd().format(_selectedDate) ||
                    endDate == DateFormat.yMd().format(_selectedDate)) {
                  if (repeat != 'Daily') {
                    if (DateFormat.EEEE().format(_selectedDate) == repeat) {
                      return Card(
                        color: itemColor, // لون خلفية البطاقة
                        elevation: 3, // قوة الظل
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // حدة الزوايا
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.medication,
                              color: Colors.red[800],
                              size: 38,
                            ),
                          ),
                          title: Text(
                            "$noteText ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: condition != "None"
                              ? Text(" $condition")
                              : const Text("  "),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => moreMData(docID)));
                                },
                                icon: const Icon(
                                  Icons.medical_information,
                                  size: 28,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    firestoreService.deletNote(docID),
                                icon: const Icon(
                                  Icons.task_alt,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Card(
                      color: itemColor, // لون خلفية البطاقة
                      elevation: 3, // قوة الظل
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // حدة الزوايا
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.medication,
                            color: Colors.red[800],
                            size: 38,
                          ),
                        ),
                        title: Text(
                          "$noteText ",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: condition != "None"
                            ? Text(" $condition")
                            : const Text("  "),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => moreMData(docID)));
                              },
                              icon: const Icon(
                                Icons.medical_information,
                                size: 28,
                              ),
                            ),
                             MyIconButton(),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
          );
        }
        //if there is no data return nothing
        else {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconTheme(
                  data: IconThemeData(color: Colors.grey[400]),
                  child: const Icon(
                    Icons.library_books_sharp,
                    size: 90,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "You don't have any medications today.",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  String calculateEndDate(int duration, String startDate) {
    DateTime startTime = DateFormat("M/d/yyyy").parse(startDate);
    DateTime endDate = startTime.add(Duration(days: duration - 1));
    String formattedDate = DateFormat('M/d/yyyy').format(endDate);
    return formattedDate;
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
          setState(() {
            _selectedDate = date;
          });
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
