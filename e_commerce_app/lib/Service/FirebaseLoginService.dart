import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/View/MainScreen/Admin%20Screen/ProductDetailScreen.dart';
import 'package:e_commerce_app/View/MainScreen/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseLoginService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //? Function for Login User's Details using Fireabase Auth

  Future<void> loginService(String email, String password) async {
    try {
      //? Firebase Authentication

      UserCredential? userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User user = userCredential.user!;

      DocumentSnapshot documentSnapshot =
          await _firestore.collection('User').doc(user.uid).get();

      String _username = documentSnapshot['username'];
      String _role = documentSnapshot['role'];
      String _email = documentSnapshot['email'];
      String _contact = documentSnapshot['contact'];

      //? Select User or Admin Role to Navigare Their Screen

      if (_role == 'User') {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setBool('Login', true);
        Get.to(
          () => MainScreen(
            username: _username,
            email: _email,
            contact: _contact,
            role: _role,
          ),
        );
      } else if (_role == 'Admin') {
        Get.to(() => ProductDetailScreen());
      }

      Get.snackbar(
        'login Successful',
        'Welcome, $_username',
        snackPosition: SnackPosition.TOP,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Login Failed',
        e.message ?? 'An unexpected error occurred',
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
