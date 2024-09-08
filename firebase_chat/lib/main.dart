import 'package:firebase_chat/Auth%20Screens/loginScreen.dart';
import 'package:firebase_chat/Auth%20Screens/registerScreen.dart';
import 'package:firebase_chat/Screens/FriendScreen.dart';
import 'package:firebase_chat/Screens/dashboardScreen.dart';
import 'package:firebase_chat/Screens/profileScreen.dart';
import 'package:firebase_chat/firebase_options.dart';
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
