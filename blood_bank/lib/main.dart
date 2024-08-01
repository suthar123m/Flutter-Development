import 'package:blood_bank/Admin%20Screen/screen/mainScreen.dart';
import 'package:blood_bank/Firebase%20Screen/loginScreen.dart';
import 'package:blood_bank/User%20Screen/screen/mainScreen.dart';
import 'package:blood_bank/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
