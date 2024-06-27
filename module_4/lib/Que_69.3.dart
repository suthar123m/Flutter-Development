import 'package:flutter/material.dart';

class MyEmailScreen extends StatefulWidget {
//  const MyEmailScreen({super.key});
  final int emailIndex;

  MyEmailScreen(this.emailIndex);
  @override
  State<MyEmailScreen> createState() => _MyEmailScreenState();
}

class _MyEmailScreenState extends State<MyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Detail Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Email subject'),
              SizedBox(
                height: 10,
              ),
              Text('From : Mahendrasuthar7425@gmail.com'),
              SizedBox(
                height: 40,
              ),
              Text('Welcome To Flutter')
            ],
          ),
        ),
      ),
    );
  }
}
