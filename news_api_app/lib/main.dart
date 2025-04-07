import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/View/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}
