import 'package:e_commerce_app/Utilis/Constant/Constants.dart';
import 'package:flutter/material.dart';

class DefaultTextfield extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String validationText;
  final TextInputType inputType;
  final TextEditingController controller;

  const DefaultTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validationText,
    required this.inputType,
    required this.controller,
  });

  @override
  State<DefaultTextfield> createState() => _DefaultTextfieldState();
}

class _DefaultTextfieldState extends State<DefaultTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 65,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: blackColor40),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: errorColor),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: blackColor40),
              gapPadding: 10,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.validationText;
            }
            return null;
          },
        ),
      ),
    );
  }
}
