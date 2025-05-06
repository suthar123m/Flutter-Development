import 'package:e_commerce_app/Service/FirebaseLoginService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseLoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseLoginService firebaseLoginService = FirebaseLoginService();

  var isLoading = false.obs;

  Future<void> fetchLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address.');
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        'Weak Password',
        'Password must be at least 6 characters long.',
      );
      return;
    }

    try {
      isLoading.value = true;

      await firebaseLoginService.loginService(email, password);

      emailController.clear();
      passwordController.clear();

      Get.back();
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading.value = false;
    }


  }
}
