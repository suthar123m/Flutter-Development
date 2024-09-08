import 'package:flutter/material.dart';

class MyTextFieldPW extends StatefulWidget {
  MyTextFieldPW(
      {super.key,
      required this.Controller,
      required this.hintText,
      required this.validatorText});

  TextEditingController Controller;
  String hintText;
  String validatorText;

  @override
  State<MyTextFieldPW> createState() => _MyTextFieldPWState();
}

class _MyTextFieldPWState extends State<MyTextFieldPW> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.Controller,
      obscureText: _obscure,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(5))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validatorText;
        }
      },
    );
  }
}
