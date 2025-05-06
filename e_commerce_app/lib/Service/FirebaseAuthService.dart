import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //? Function for Register User's Details Using Firebase Auth and Firebase Firestore

  Future<void> firebaseAuth(
    String email,
    String password,
    String username,
    String contact,
    var role,
  ) async {
    try {
      //? Firebase Authentication

      UserCredential? userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user!;

      //? Save user data to Firestore (excluding password)

      await _firestore.collection('User').doc(user.uid).set({
        'uid': user.uid,
        'email': email,
        'username': username,
        'contact': contact,
        'password': password,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar(
        'Registration Successful',
        'Welcome, ${user.email}',
        snackPosition: SnackPosition.TOP,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Registration Failed',
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
