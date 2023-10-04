import 'package:flutter/material.dart';

class AddMedicinePage extends StatelessWidget {
  static const String routename = 'add medicine ';
  const AddMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(), 
      body: Container(
        child: Text("Hello"),
      ),
    );
  }
}
_appBar() {
  return AppBar(
    backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
    title:
    //leading: const //Make things just the beginning
      const Text(
      'Add your medication information',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        
      ),
    ),
  );
}
