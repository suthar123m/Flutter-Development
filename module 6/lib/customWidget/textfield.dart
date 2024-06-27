import 'package:flutter/material.dart';

Widget MyTextFieldWidget(TextEditingController controller, String? hintText,
    {bool readOnly = true}) {
  return Container(
      child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      enabled: readOnly,
      controller: controller,
      style: TextStyle(
          color: Color.fromARGB(255, 51, 10, 51), fontWeight: FontWeight.bold),
      obscureText: hintText == "Password" ? true : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: readOnly ? Colors.white : Colors.blueGrey[30],
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.deepPurple[300], fontWeight: FontWeight.bold),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 206, 193, 193))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 206, 193, 193))),
      ),
    ),
  ));
}
