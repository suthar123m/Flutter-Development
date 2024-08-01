import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_1.dart';
import 'package:tea_diary/screen/NerOrder.dart';
import 'package:tea_diary/screen/SellerList.dart';
import 'package:tea_diary/screen/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
