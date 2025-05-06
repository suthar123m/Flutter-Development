import 'package:e_commerce_app/Utilis/widget/Default_TextField.dart';
import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/ViewModel/FirebaseForgorPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgotpasswordscreen extends StatefulWidget {
  const Forgotpasswordscreen({super.key});

  @override
  State<Forgotpasswordscreen> createState() => _ForgotpasswordscreenState();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen> {
  FirebaseForgorPasswordController firebaseForgorPasswordController =
      Get.put(FirebaseForgorPasswordController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Recover PassWord',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(height: 50),
                DefaultTextfield(
                  controller: firebaseForgorPasswordController.emailController,
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  validationText: 'Please Enter Email',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseForgorPasswordController.fetchForgotPassword();
                      }
                    },
                    child: DefaultButton(buttonText: 'RESET PASSWORD')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
