/*
  Write a code to display simple alert dialog with title, description and 
  icon when button is clicked */

import 'package:flutter/material.dart';

class Que_62_Simple_alert extends StatefulWidget {
  const Que_62_Simple_alert({super.key});

  @override
  State<Que_62_Simple_alert> createState() => _Que_62_Simple_alertState();
}

class _Que_62_Simple_alertState extends State<Que_62_Simple_alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Alert Box'),
      ),
      body: Center(
        child: Container(
          height: 40,
          width: 150,
          child: ElevatedButton(
              onPressed: () {
                // Alert baar
                DisplayDialog(context);
              },
              child: Text('CLICK HEAR')),
        ),
      ),
    );
  }
}

void DisplayDialog(BuildContext context) {
  print("Dialog Display");

  var alert = AlertDialog(
    title: Text('Are you sure to display Alert'),
    content: Text('Alert'),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'))
    ],
  );

  showDialog(context: context, builder: (context) => alert);
}
// ok