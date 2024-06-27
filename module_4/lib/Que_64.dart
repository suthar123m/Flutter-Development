/*
Write a code to display alert dialog with list of cities and Single 
choice selection display selected city in TextView
*/

import 'package:flutter/material.dart';

class Que_64_AlertBox extends StatefulWidget {
  const Que_64_AlertBox({super.key});

  @override
  State<Que_64_AlertBox> createState() => _Que_64_AlertBoxState();
}

class _Que_64_AlertBoxState extends State<Que_64_AlertBox> {
  String? cities = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Box'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 50,
            width: 150,
            child: ElevatedButton(
                onPressed: () {
                  // Alert Box
                  Cities_name(context);
                },
                child: Text('Cities')),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              '${cities}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }

  void Cities_name(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alert'),
      content: Text('Cities Name Here'),
      actions: [
        RadioListTile(
          value: 'Ahmedabad',
          title: Text('Ahmedabad'),
          groupValue: cities,
          onChanged: (value) {
            setState(() {
              cities = value;
              Navigator.pop(context);
            });
          },
        ),
        RadioListTile(
          value: 'Jaipur',
          title: Text('Jaipur'),
          groupValue: cities,
          onChanged: (value) => setState(() {
            cities = value;
            Navigator.pop(context);
          }),
        ),
        RadioListTile(
          value: 'Ajmer',
          title: Text('Ajmer'),
          groupValue: cities,
          onChanged: (value) => setState(() {
            cities = value;
            Navigator.pop(context);
          }),
        ),
        RadioListTile(
          value: 'Udaipur',
          title: Text('Udaipur'),
          groupValue: cities,
          onChanged: (value) => setState(() {
            cities = value;
            Navigator.pop(context);
          }),
        ),
        RadioListTile(
          value: 'Jodpur',
          title: Text('Jodpur'),
          groupValue: cities,
          onChanged: (value) => setState(() {
            cities = value;
            Navigator.pop(context);
          }),
        ),
        RadioListTile(
          value: 'Surat',
          title: Text('Surat'),
          groupValue: cities,
          onChanged: (value) => setState(() {
            cities = value;
            Navigator.pop(context);
          }),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
