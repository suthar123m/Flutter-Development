import 'package:e_commerce_app/Service/FirebaseForgotPasswordService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseForgorPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  FirebaseForgotpasswordService firebaseForgotpasswordService =
      FirebaseForgotpasswordService();

  Future<void> fetchForgotPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    await firebaseForgotpasswordService.forgetPasswordService(email);
  }
}
