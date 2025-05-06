import 'package:e_commerce_app/Service/FirebaseAuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final contactController = TextEditingController();

  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  var isLoading = false.obs;

  Future<void> fetchFirebaseAuthdata(String role) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final username = usernameController.text.trim();
    final contact = contactController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        username.isEmpty ||
        contact.isEmpty) {
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

      // Register the user
      await firebaseAuthService.firebaseAuth(
        email,
        password,
        username,
        contact,
        role,
      );

    } catch (e) {
      Get.snackbar(
        'Registration Failed',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
