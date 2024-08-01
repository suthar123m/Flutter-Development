import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.hintTaxt,
    required this.LableText,
    required this.controller,
  });
  String hintTaxt;
  String LableText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: hintTaxt,
            labelText: LableText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your $LableText';
          }
        },
      ),
    );
  }
}
