import 'package:CureHelper/component/cure_button.dart';
import 'package:flutter/material.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/input_field.dart';
import 'package:intl/intl.dart';
import 'package:CureHelper/component/my_button.dart';

class AddMedicinePage extends StatefulWidget {
  static const String routename = 'add medicine ';
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amoutController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();

  //Entry fields
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedPackages = 1;
  List<int> packagesList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  String _selectedCondition = "None";
  List<String> conditionList = [
    "None",
    "After eating",
    "Before eating",
    "Before sleeping",
    "Early in the morning"
  ];
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  // colors
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                // start from here BODY
                child: SingleChildScrollView(
                  // can move the page.
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
                      //Medicine name
                      MyInputField(
                        title: "Medicine name: ",
                        hint: "Enter your medicine name ",
                        controller: _titleController,
                      ),
                      //Price
                      MyInputField(
                        title: "Price: ",
                        hint: "Enter the price of the medicine",
                        controller: _priceController,
                      ),
                      //Amount of medication
                      MyInputField(
                        title: "Amount of medication: ",
                        hint: "How many pills are in the package?",
                        controller: _amoutController,
                      ),
                      //Number of box meicine <and in Row> //Dose
                      Row(
                        children: [
                          Expanded(
                            child: MyInputField(
                              title: "Packages Number: ",
                              hint: "$_selectedPackages",
                              widget: DropdownButton(
                                items: packagesList
                                    .map<DropdownMenuItem<String>>((int value) {
                                  return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()));
                                }).toList(),
                                onChanged: (String? newVlaue) {
                                  setState(() {
                                    _selectedPackages = int.parse(newVlaue!);
                                  });
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey,
                                ),
                                iconSize: 30,
                                elevation: 4,
                                underline: Container(
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyInputField(
                              title: "Medication dose: ",
                              hint: "How many doses",
                              controller: _doseController,
                            ),
                          ),
                        ],
                      ),
                      //Start date <and in Row> //Time
                      Row(
                        children: [
                          Expanded(
                            child: MyInputField(
                              title: "Start date: ",
                              hint: DateFormat.yMd().format(_selectedDate),
                              widget: IconButton(
                                icon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _getDateFormUser();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyInputField(
                              title: "Time",
                              hint: _startTime,
                              widget: IconButton(
                                  onPressed: () {
                                    _getTimeFromUser(isStartTime: true);
                                  },
                                  icon: const Icon(
                                    Icons.alarm,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      //Condition
                      MyInputField(
                        title: "Condition: ",
                        hint: "$_selectedCondition ",
                        widget: DropdownButton(
                          items: conditionList
                              .map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value!,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newVlaue) {
                            setState(() {
                              _selectedCondition = newVlaue!;
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
                          iconSize: 30,
                          elevation: 4,
                          underline: Container(
                            height: 0,
                          ),
                        ),
                      ),
                      //Remind <and in Row> //Repeat
                      Row(
                        children: [
                          Expanded(
                            child: MyInputField(
                              title: "Remind: ",
                              hint: "$_selectedRemind minutes early",
                              widget: DropdownButton(
                                items: remindList
                                    .map<DropdownMenuItem<String>>((int value) {
                                  return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()));
                                }).toList(),
                                onChanged: (String? newVlaue) {
                                  setState(() {
                                    _selectedRemind = int.parse(newVlaue!);
                                  });
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey,
                                ),
                                iconSize: 30,
                                elevation: 4,
                                underline: Container(
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyInputField(
                              title: "Repeat: ",
                              hint: "$_selectedRepeat ",
                              widget: DropdownButton(
                                items: repeatList.map<DropdownMenuItem<String>>(
                                    (String? value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value!,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newVlaue) {
                                  setState(() {
                                    _selectedRepeat = newVlaue!;
                                  });
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey,
                                ),
                                iconSize: 30,
                                elevation: 4,
                                underline: Container(
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Save button and change colors
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _colorPallete(),
                          button(
                              onTab: () {
                                if (_titleController.text.isNotEmpty &&
                                    _priceController.text.isNotEmpty &&
                                    _amoutController.text.isNotEmpty &&
                                    _doseController.text.isNotEmpty) {
                                  // add to database 'method '
                                  Navigator.of(context).pushNamed(
                                      homePage.routename); // go to home page
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(sanacbar);
                                }
                              },
                              text: "Create alarm")
                        ],
                      )
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

  final sanacbar = SnackBar(
    backgroundColor: Colors.grey[300],
    duration: const Duration(milliseconds: 3000),
    content: const Row(
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(
          width: 14,
        ),
        Text(
          "All fields are required ! ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            //backgroundColor: Colors.white,
            color: Colors.black,
          ),
        ),
      ],
    ),
    padding: const EdgeInsets.all(14),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color: ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          // Because it shows the elements horizontally.
          children: List<Widget>.generate(
            3,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? Colors.lightBlueAccent // first
                        : index == 1
                            ? const Color.fromARGB(255, 213, 58, 110) // seconde
                            : const Color.fromARGB(
                                255, 176, 240, 103), // theards
                    child: _selectedColor == index
                        ? const Icon(
                            Icons.done_outline_rounded,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _getDateFormUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2123));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceld");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        // _startTime --> 10:30 AM
        hour: int.parse(_startTime.split(":")[0]), // the first index "10"
        minute: int.parse(
          _startTime.split(":")[1].split(" ")[0], // the second index "30 AM"
        ),
      ),
    );
  }
}
