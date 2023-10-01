import 'package:CureHelper/component/navigationBar.dart';
import 'package:CureHelper/screens/add_page.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../component/cure_button.dart';


class homePage extends StatefulWidget {
  static const String routename = 'home';
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}
DateTime _selectedDate = DateTime.now();

class _homePageState extends State<homePage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const myNavigationBar(),
      //appBar: _appBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(63, 81, 181, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                // start from here BODY
                child: Column(
                  children: [
                    _addMedicineBar(), // First row (day, date, and add button)
                    _addDateBar(),  // Second row (date_timeline)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _addMedicineBar(){
  return
    Container(
    margin:
    const EdgeInsets.only( top: 15),
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
        Navigator.of(context).pushNamed(AddMedicinePage.routename); // go to add page
      }, 
      text: "     +     ",
      variants: "dark",
    ),
    ],
    ),
  );                  
}
_addDateBar(){
return 
  Container(
    margin: const EdgeInsets.only(top: 15),
    child: DatePicker(
      DateTime.now(),
      height: 95,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor:const Color.fromARGB(255, 63, 81, 181),
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
      onDateChange: (date){
        _selectedDate = date;
      },
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
