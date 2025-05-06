import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseForgotpasswordService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //? Function for Reset Password for Email using Firebase Auth

  Future<void> forgetPasswordService(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      Get.snackbar(
        'Send Email Successful',
        'Email :  $email',
        snackPosition: SnackPosition.TOP,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Unexpected Error: $error',
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
