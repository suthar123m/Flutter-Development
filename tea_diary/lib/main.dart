import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tea_diary(),
    );
  }
}
