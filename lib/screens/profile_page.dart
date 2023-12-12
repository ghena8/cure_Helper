import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../component/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> showLoading(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Loading...",
          style: const TextStyle(color: Colors.white),
        ),
        content: LinearProgressIndicator(
          color: Colors.grey,
          backgroundColor: Colors.grey[900],
        ),
      ),
    );
  }

  String newValue = '';
  bool isUpdating = false;
  final users = FirebaseFirestore.instance.collection("users");

  Future<Map<String, dynamic>?> getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    try {
      final value = await users.doc(currentUser!.uid).get();
      return value.data() as Map<String, dynamic>?;
    } catch (error) {
      return null;
    }
  }

  Future<void> updateField(String field) async {
    setState(() {
      isUpdating = true;
    });

    showLoading(context);

    final currentUser = FirebaseAuth.instance.currentUser;

    try {
      await users.doc(currentUser!.uid).update({field: newValue});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Update successful!"),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error updating $field"),
        ),
      );
    } finally {
      setState(() {
        isUpdating = false;
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    Future<void> editField(String field) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Edit $field",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              newValue = value;
            },
            onSubmitted: (value) async {
              await updateField(field);
            },
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.5,
                  horizontal: 9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "PROFILE",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(25),
                ),
              ),
              child: FutureBuilder<Map<String, dynamic>?>(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Text('Error fetching user data.');
                  } else {
                    final userData = snapshot.data!;
                    return ListView(
                      children: [
                        SizedBox(height: 50),
                        Icon(
                          Icons.person,
                          color: Colors.grey[400],
                          size: 72,
                        ),
                        SizedBox(height: 10),
                        Text(
                          currentUser?.email ?? 'N/A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            "My Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        MyTextBox(
                          text: userData['username'] ?? 'N/A',
                          sectionName: 'username',
                          onPressed: () => editField('username'),
                        ),
                        SizedBox(height: 30),
                        MyTextBox(
                          text: userData['bio'] ?? 'N/A',
                          sectionName: 'bio',
                          onPressed: () => editField('bio'),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
