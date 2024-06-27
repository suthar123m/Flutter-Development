
import 'package:firebase_class_project/customWidget/colorfiles.dart';
import 'package:flutter/material.dart';

Widget MyCustomButton(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 35),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.deepPurple,
                const Color.fromARGB(255, 128, 107, 165)
              ])),
      height: 50,
      width: 310,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: DISPLAY_TEXT_COLOR,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      )),
    ),
  );
}
