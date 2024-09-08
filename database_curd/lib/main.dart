import 'package:database_curd/screen/adduserScreen.dart';
import 'package:database_curd/screen/dashboardScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddUserScreen(),
    );
  }
}
