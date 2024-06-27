import 'package:flutter/material.dart';

class MySliderExample2 extends StatefulWidget {
  const MySliderExample2({super.key});

  @override
  State<MySliderExample2> createState() => _MySliderExample2State();
}

class _MySliderExample2State extends State<MySliderExample2> {
  double redColor = 0;
  double greenColor = 0;
  double blueColor = 0;

  int red = 0;
  int green = 0;
  int blue = 0;

  Color? redcolorname = Colors.red;
  Color? greencolorname = Colors.green;
  Color? bluecolorname = Colors.blue;

  Color? finalColor = Colors.black;

  void changeColor() {
    finalColor = Color.fromRGBO(red, green, blue, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Color Task"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              color: redcolorname,
            ),
          ),
          Slider(
              value: redColor,
              max: 255,
              onChanged: (Value) {
                setState(() {
                  redColor = Value;
                  red = redColor.round().toInt();
                  changeColor();
                });
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              color: greencolorname,
            ),
          ),
          Slider(
              value: greenColor,
              max: 255,
              onChanged: (Value) {
                setState(() {
                  greenColor = Value;
                  green = greenColor.round().toInt();
                  changeColor();
                });
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              color: bluecolorname,
            ),
          ),
          Slider(
              value: blueColor,
              max: 255,
              onChanged: (Value) {
                setState(() {
                  blueColor = Value;
                  blue = blueColor.round().toInt();
                  //print("blue ====$blue");
                  changeColor();
                });
              }),
          Container(
            height: 50,
            color: finalColor,
          )
        ],
      ),
    );
  }
}
