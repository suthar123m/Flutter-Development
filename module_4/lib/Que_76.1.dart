//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:module_4/Que_76.2.dart';

class Que_76_1 extends StatefulWidget {
  const Que_76_1({super.key});

  @override
  State<Que_76_1> createState() => _Que_74_1State();
}

class _Que_74_1State extends State<Que_76_1> {
  TextEditingController _n1Controller = TextEditingController();
  TextEditingController _n2Controller = TextEditingController();
  int? num_1;
  int? num_2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              width: 300,
              child: TextField(
                controller: _n1Controller,
                decoration: InputDecoration(
                    hintText: 'Enter number 1',
                    label: Text('Enter Number'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              width: 300,
              child: TextField(
                controller: _n2Controller,
                decoration: InputDecoration(
                    hintText: 'Enter number 2',
                    label: Text('Enter Number'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 3,
              color: Colors.black,
              indent: 100,
              endIndent: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num_1 = int.parse(_n1Controller.text);
                      num_2 = int.parse(_n2Controller.text);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Que_76_2(
                                  num_1: int.parse(_n1Controller.text),
                                  num_2: int.parse(_n2Controller.text),
                                )));
                  },
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
