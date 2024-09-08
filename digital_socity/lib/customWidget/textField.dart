import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.Controller,
    required this.hintText,
    required this.validatorText,
  });
  TextEditingController Controller;
  String hintText;
  String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(5))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
      },
    );
  }
}
