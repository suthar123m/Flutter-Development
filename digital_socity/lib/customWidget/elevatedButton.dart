import 'package:flutter/material.dart';

class MyEleButton extends StatelessWidget {
  MyEleButton({
    super.key,
    required this.eleColor,
    required this.eleText,
    required this.eleBorder,
    required this.fontColor,
  });
  Color eleColor;
  String eleText;
  Color eleBorder;
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Text(
        eleText,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontColor,
            letterSpacing: 3),
      )),
      decoration: BoxDecoration(
          border: Border.all(color: eleBorder, width: 0.5),
          color: eleColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
