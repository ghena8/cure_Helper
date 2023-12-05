import 'package:CureHelper/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/input_field.dart';
import 'package:intl/intl.dart';
import 'package:CureHelper/component/my_button.dart';
//import 'package:get/get.dart';
//import '../controllers/taskM_controller.dart';
//import '../models/medicineTask.dart';

class AddMedicinePage extends StatefulWidget {
  static const String routename = 'add medicine ';
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  //final TaskMController _taskMController = Get.put(TaskMController());

  //text controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  //Entry fields
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedAmountBox = 1;
  int _selectedDuration = 1;
  List<int> amountBoxList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    50,
    60,
    70,
    80,
    90
  ];
  int _selectedPackages = 1;
  int _selectedDose = 1;
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
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
              //Medicine name<and in Row> //Price
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Medicine name: ",
                      hint: "Enter medicine name ",
                      controller: _titleController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyInputField(
                      title: "Price: ",
                      hint: "Enter price of medicine",
                      controller: _priceController,
                    ),
                  ),
                ],
                //Medicine name
                // MyInputField(
                //   title: "Medicine name: ",
                //   hint: "Enter your medicine name ",
                //   controller: _titleController,
                // ),
                // //Price
                // MyInputField(
                //   title: "Price: ",
                //   hint: "Enter the price of the medicine",
                //   controller: _priceController,
                // ),
              ),
              //Duration
              MyInputField(
                title: "How many days will take medicine: ",
                hint: "$_selectedDuration days",
                widget: DropdownButton(
                  items:
                      amountBoxList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                        value: value.toString(), child: Text(value.toString()));
                  }).toList(),
                  onChanged: (String? newVlaue) {
                    setState(() {
                      _selectedDuration = int.parse(newVlaue!);
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
              //Amount of medication
              MyInputField(
                title: "How many pills are in the package?",
                hint: "$_selectedAmountBox pills",
                widget: DropdownButton(
                  items:
                      amountBoxList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                        value: value.toString(), child: Text(value.toString()));
                  }).toList(),
                  onChanged: (String? newVlaue) {
                    setState(() {
                      _selectedAmountBox = int.parse(newVlaue!);
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
              // //Number of box meicine <and in Row> //Dose
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Packages Number: ",
                      hint: "$_selectedPackages box",
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
                      title: "How many doses ? ",
                      hint: "$_selectedDose pills",
                      widget: DropdownButton(
                        items: packagesList
                            .map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()));
                        }).toList(),
                        onChanged: (String? newVlaue) {
                          setState(() {
                            _selectedDose = int.parse(newVlaue!);
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
                        items: repeatList
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
                            _priceController.text.isNotEmpty) {
                          //_addTaskMToDb(); // add to database 'method '

                          // add a new medicine
                          // if (docID == null ) {
                          firestoreService.addNote(
                            _titleController.text,
                            _priceController.text,
                            _selectedAmountBox,
                            _selectedDuration,
                            _selectedPackages,
                            _selectedDose,
                            DateFormat.yMd().format(_selectedDate),
                            _startTime,
                            _selectedCondition,
                            _selectedColor,
                            _selectedRemind,
                            _selectedRepeat,
                          ); // }
                          // // update a medicine data
                          // else {
                          //   firestoreService.updateNote(docID, _titleController.text);
                          // }

                          //clear the text controller
                          _titleController.clear();

                          Navigator.of(context)
                              .pushNamed(homePage.routename); // go to home page
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(sanacbar);
                        }
                      },
                      text: "Create alarm")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // _addTaskMToDb() async {
  //   int value = await _taskMController.addTaskM(
  //     task: medicineTask(
  //       medicineName: _titleController.text,
  //       price: _priceController.text,
  //       isCompleted: 0,
  //       amountOfMedication: _selectedAmountBox,
  //       packagesNumber: _selectedPackages,
  //       medicationDose: _selectedDose,
  //       startDate: DateFormat.yMd().format(_selectedDate),
  //       time: _startTime,
  //       condition: _selectedCondition,
  //       color: _selectedColor,
  //       remind: _selectedRemind,
  //       repeat: _selectedRepeat,
  //     ),
  //   );
  //   print("My id is " + "$value ");
  // }

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

  _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // leading: const //Make things just the beginning
      title: const Text(
        "Add your medication information",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
//  Scaffold(
//       //appBar: _appBar(),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(63, 81, 181, 1),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // title page + back icon
//             SafeArea(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           iconSize: 28,
//                           color: Colors.white,
//                           icon: const Icon(Icons.arrow_back_ios),
//                           onPressed: () {
//                             Navigator.of(context).pushNamed(
//                                 homePage.routename); // go  back to home page
//                           },
//                         ),
//                         const Text(
//                           "Add your medication information",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height *
//                   0.85, // 70% of screen height
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(25)),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//                 // start from here BODY
