import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                  0.80, // 80% of screen height
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
                    // row 1 : the name of medicin
                    const Text(
                      "Medicine ame: ",
                      style: TextStyle(
                        fontSize: 23,
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
                            "${moreDetalOfM[0]['medicineName']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                    const SizedBox(height: 28),
                    // row 2: duration
                    const Text(
                      "Duration : ",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "// The result equation", //The output call from a method contains a formula to calculate the duration
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 28),
                    // row 3 : cost
                    const Text(
                      "Medicine cost: ",
                      style: TextStyle(
                        fontSize: 23,
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
                            "${moreDetalOfM[0]['price']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                    const SizedBox(height: 28),
                    //row 4 : time
                    const Text(
                      "Time to take medicine: ",
                      style: TextStyle(
                        fontSize: 23,
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
                    //row 5 : the end day
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Start date",
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
                        const Column(
                          // befor do "End date", try to delete const
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End date",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              "//Result equation",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
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
}
