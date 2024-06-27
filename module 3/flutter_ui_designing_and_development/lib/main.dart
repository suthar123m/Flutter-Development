import 'package:flutter/material.dart';
import 'package:flutter_ui_designing_and_development/flutter%20ui%20designing%20and%20development/Q_51.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputScreen(),
    );
  }
}
