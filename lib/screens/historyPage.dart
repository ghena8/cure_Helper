//import 'package:flutter/foundation.dart';
import 'package:CureHelper/screens/moreMedicineData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:CureHelper/screens/searchPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:intl/intl.dart';

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
                              Navigator.of(context).pushNamed(
                                  homePage.routename); // go to home page
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          const Text(
                            "History Medicition",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.72, // 80% of screen height
              width: double.infinity,
              alignment: Alignment.center,
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
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "List of previously taken medications",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _readMedicine()
                    ],
                  )),
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

                return Container(
                  //margin: EdgeInsets.all(8.0), // هنا يتم تعيين الهوامش الخارجية
                  child: Card(
                    color: Colors.indigo.withOpacity(0.8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding:const EdgeInsets.only(left: 15, top: 12, right:  15, bottom: 10), // هنا يتم تعيين الهوامش الداخلية
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.medication,
                          color: Colors.grey[700],
                          size: 38,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only( bottom:10.0), // إضافة هامش سفلي بين title و subtitle
                        child: Text(
                          "$noteText",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "start: $startDate end: $endDate",
                        style: const TextStyle(color: Colors.white , fontSize: 17,),
                        
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => moreMData(docID)));
                            },
                             icon:const  Icon(
                              Icons.medical_information,
                             color: Colors.white,
                              size:33,
                            ),
                          ),
                          IconButton(
                            onPressed: () => firestoreService.deletNote(docID),
                            icon:const  Icon(
                              Icons.delete_forever,
                             color: Colors.white,
                              size:33,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
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

  myNavigationBar() {
    int _selectedIndex = 2;
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
