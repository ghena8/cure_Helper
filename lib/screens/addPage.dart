import 'package:flutter/material.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/input_field.dart';
import 'package:intl/intl.dart';


class AddMedicinePage extends StatefulWidget {
  static const String routename = 'add medicine ';
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: _appBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(63, 81, 181, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // title page + back icon
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          iconSize: 28,
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                homePage.routename); // go  back to home page
                          },
                        ),
                        const Text(
                          "Add your medication information",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.85, // 70% of screen height
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),
              child:  Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
                // start from here BODY
                child: SingleChildScrollView(     // can move the page.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Add Medicine ",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const MyInputField(title: "Medicine name: ", hint: "Enter your medicine name "),
                      const MyInputField(title: "Price: ", hint: "Enter the price of the medicine"),
                      const MyInputField(title: "Amount of medication: ", hint: "How many pills are in the package?"),
                      //Number of box medicine
                      //Dose 
                      MyInputField(title: "Start date: ", hint: DateFormat.yMd().format(_selectedDate))
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
}
  