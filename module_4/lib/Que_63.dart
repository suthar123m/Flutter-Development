/* 
Write a code to display alert dialog with positive, negative and 
neutral button and display toast respectively user's choice
*/

import 'package:flutter/material.dart';

class Que_63_Alert extends StatefulWidget {
  var count = 0;
  Que_63_Alert({super.key});

  @override
  State<Que_63_Alert> createState() => _Que_63_AlertState();
}

class _Que_63_AlertState extends State<Que_63_Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Box'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  DisplayDialog(context);
                },
                child: Text('Click Hear')),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 150,
              child: Card(
                child: Center(
                  child: Text(
                    '${widget.count}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void DisplayDialog(BuildContext context) {
    print('Display Alert Dialog');

    var alert = AlertDialog(
      title: Text('Alert'),
      content: Text('Are you sure you want to display'),
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                widget.count++; // for Add Count Number
              });
              print('${widget.count}');
            },
            child: Text('Add')),
        ElevatedButton(
            onPressed: () {
              setState(() {
                widget.count--; // for Less Count Number
              });
              print('${widget.count}');
            },
            child: Text('Less')),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text('Back')),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
