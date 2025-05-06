import 'package:e_commerce_app/Utilis/Constant/Constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String buttonText;

  DefaultButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: kPrimeryColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(color: whiteColor, fontSize: 17),
        ),
      ),
    );
  }
}
