import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseLogOutService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //? Function for Logout User using Firebase Auth

  Future<void> logoutService() async {
    await _firebaseAuth.signOut();
    Get.back();
  }
}
