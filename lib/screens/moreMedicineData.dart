import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class moreMData extends StatefulWidget {
  static const String routename = 'moreMData';

  String docId;
  moreMData(this.docId);

  @override
  State<moreMData> createState() => _moreMDataState();
}

class _moreMDataState extends State<moreMData> {
  //const moreMData({super.key, required this.docId});
  DocumentReference? detailsMData;

  List moreDetalOfM = [];
  @override
  void initState() {
    super.initState();
    detailsMData =
        FirebaseFirestore.instance.collection('notes').doc(widget.docId);
    getData();
  }
  //detailsMData = FirebaseFirestore.instance.collection('notes').doc(widget.docId);

  getData() async {
    var responsebody = await detailsMData!.get();
    setState(() {
      moreDetalOfM.add(responsebody.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              Navigator.of(context).pop();
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
                            "Details information",
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
                  0.83, // 80% of screen height
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 28),
                    // row 1 : the name of medicin +  // row 1 : cost
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Medicine name: ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    "${moreDetalOfM[0]['medicineName']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Medicine cost: ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    "${moreDetalOfM[0]['price']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // row 2: duration
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Duration : ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    checkDuration(saveDurationValue()),
                                    //"${moreDetalOfM[0]['duration']}  days",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Medication dose: ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    "${moreDetalOfM[0]['medicationDose']} pills in a day",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    //row 3 : time
                    const Text(
                      "Time to take medicine: ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    moreDetalOfM.isEmpty || moreDetalOfM == null
                        ? const Text(
                            " Loding",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        : Text(
                            "${moreDetalOfM[0]['time']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                    const SizedBox(height: 28),
                    //row 4 : condation
                    const Text(
                      "Condition for taking medication: ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    moreDetalOfM.isEmpty || moreDetalOfM == null
                        ? const Text(
                            " Loding",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        : Text(
                            "${moreDetalOfM[0]['condition']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),

                    const SizedBox(height: 28),
                    //row 5: the end day + start day
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Start date",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    "${moreDetalOfM[0]['startDate']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "End date",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),
                            moreDetalOfM.isEmpty || moreDetalOfM == null
                                ? const Text(
                                    " Loding",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    calculateEndDate(saveDurationValue(),
                                        saveStartDateValue()),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    //row 4 : condation
                    const Text(
                      "Repeat :  ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    moreDetalOfM.isEmpty || moreDetalOfM == null
                        ? const Text(
                            " Loding",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        : Text(
                            "${moreDetalOfM[0]['repeat']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                    const SizedBox(height: 40),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        button(
                            onTab: () {
                              Navigator.of(context).pushNamed(
                                  homePage.routename); // go to home page
                            },
                            text: "Done"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// resd from database the (RepeatValue)
  String saveRepeatValue() {
    String repeatText = "";
    repeatText = moreDetalOfM.isEmpty || moreDetalOfM == null
        ? "Loading"
        : moreDetalOfM[0]['repeat'];
    return repeatText;
  }

// resd from database the (amountOfMedicationValue)
  int saveamountOfMedicationValue() {
    int amountOfMedication = 0;

    amountOfMedication = moreDetalOfM.isEmpty || moreDetalOfM == null
        ? "Loading"
        : moreDetalOfM[0]['amountOfMedication'];
    return amountOfMedication;
  }

// resd from database the (DurationValue)
  int saveDurationValue() {
    int amountOfMedication = 0;

    amountOfMedication = moreDetalOfM.isEmpty || moreDetalOfM == null
        ? "Loading"
        : moreDetalOfM[0]['duration'];
    return amountOfMedication;
  }

// resd from database the (saveStartDateValue)
  String saveStartDateValue() {
    String startDate = "";

    startDate = moreDetalOfM.isEmpty || moreDetalOfM == null
        ? "Loading"
        : moreDetalOfM[0]['startDate'];

    return startDate;
  }

  String checkDuration(int days) {
    String durationOutput;
    if (days < 30) {
      // print('القيمة: $days يوم');
      durationOutput = ' $days days ';
      return durationOutput;
    } else {
      int months = days ~/ 30;
      int remainingDays = days % 30;
      // print('شهر: $months, المتبقي من الأيام: $remainingDays');
      if (remainingDays == 0) {
        durationOutput = ' $months  months';
        return durationOutput;
        //print('شهر: $months');
      } else {
        durationOutput = ' $months and $remainingDays days ';
        return durationOutput;
        // print('شهر: $months, المتبقي من الأيام: $remainingDays');
      }
    }
  }

  String calculateEndDate(int duration, String startDate) {
    DateTime startTime = DateFormat("M/d/yyyy").parse(startDate);
    DateTime endDate = startTime.add(Duration(days: duration - 1));
    String formattedDate = DateFormat('M/d/yyyy').format(endDate);
    return formattedDate;
  }

  // Duration calculateMedicationDuration(
  //     String starTime, int pillsPerBox, String interval) {
  //   DateTime? endDate;
  //   DateTime startTime = DateFormat("M/d/yyyy").parse(starTime);
  //   if (interval == 'daily') {
  //     endDate = startTime.add(const Duration(days: 1));
  //   } else if (interval == 'weekly') {
  //     endDate = startTime.add(const Duration(days: 7));
  //   } else if (interval == 'monthly') {
  //     endDate = startTime.add(const Duration(days: 30));
  //   }
  //   DateTime now = DateTime.now();
  //   if (endDate != null && endDate.isAfter(now)) {
  //     endDate = now;
  //   } else if (endDate == null) {
  //     endDate = now;
  //   }
  //   Duration duration = endDate.difference(startTime);
  //   int totalPills = pillsPerBox;
  //   int pillsLeft = totalPills - (duration.inDays * pillsPerBox);
  //   print('مدة الاستخدام: ${duration.inDays} أيام');
  //   print('عدد الحبوب المتبقية: $pillsLeft حبة');
  //   return duration;
  // }
}
