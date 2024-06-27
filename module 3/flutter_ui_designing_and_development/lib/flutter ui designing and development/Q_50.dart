//Create an application to take input number from user and print its reverse number in TextField

import 'package:flutter/material.dart';

class ReverseNumber extends StatefulWidget {
  const ReverseNumber({Key? key}) : super(key: key);

  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

class _ReverseNumberState extends State<ReverseNumber> {
  TextEditingController _reversenumber = TextEditingController();
  String reverse_number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 250,
            child: TextField(
              controller: _reversenumber,
              decoration: InputDecoration(
                  hintText: 'Enter Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  reverse_number =
                      _reversenumber.text.split('').reversed.join();
                });
              },
              child: Text('Reverse')),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
            child: Center(
                child: Text(
              reverse_number,
              style: TextStyle(fontSize: 18),
            )),
          ),
        ],
      )),
    );
  }
}
