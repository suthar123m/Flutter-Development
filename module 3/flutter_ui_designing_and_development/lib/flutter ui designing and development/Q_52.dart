/* Create an application with radio buttons (Add, Substraction, Multiply, Division) EditText(number1, number2) and print result as
per user choice from radio button in TextView*/

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String? _Calculator = "";
  int num_1 = 0, num_2 = 0, result = 0;
  final TextEditingController _number1 = TextEditingController();
  final TextEditingController _number2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
              height: 100,
              width: double.maxFinite,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: _number1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Number 1',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                    height: 40,
                    width: 150,
                    child: TextField(
                      controller: _number2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Number 2',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ))
              ])),
          SizedBox(
            height: 10,
          ),
          Divider(color: Colors.black, indent: 40, endIndent: 40),
          SizedBox(
            height: 10,
          ),
          RadioListTile(
            value: 'ADDITION',
            title: Text('ADDITION'),
            groupValue: _Calculator,
            onChanged: (value) {
              setState(() {
                _Calculator = value as String;
                num_1 = int.parse(_number1.text);
                num_2 = int.parse(_number2.text);
                result = num_1 + num_2;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RadioListTile(
            value: 'SUBSTRANTION',
            title: Text('SUBSTRANTION'),
            groupValue: _Calculator,
            onChanged: (value) {
              setState(() {
                _Calculator = value as String;
                num_1 = int.parse(_number1.text);
                num_2 = int.parse(_number2.text);
                result = num_1 - num_2;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RadioListTile(
            value: 'MULTIPLICATION',
            title: Text('MULTIPLICATION'),
            groupValue: _Calculator,
            onChanged: (value) {
              setState(() {
                _Calculator = value as String;
                num_1 = int.parse(_number1.text);
                num_2 = int.parse(_number2.text);
                result = num_1 * num_2;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RadioListTile(
            value: 'DIVISION',
            title: Text('DIVISION'),
            groupValue: _Calculator,
            onChanged: (value) {
              setState(() {
                _Calculator = value as String;
                num_1 = int.parse(_number1.text);
                num_2 = int.parse(_number2.text);
                result = num_1 ~/ num_2;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(color: Colors.black, indent: 40, endIndent: 40),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 250,
            child: Center(
                child: Text(
              'Result : $result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black26),
                borderRadius: BorderRadiusDirectional.circular(10)),
          )
        ],
      ),
    );
  }
}
