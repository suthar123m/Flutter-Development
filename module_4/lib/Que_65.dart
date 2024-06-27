// open alert dialog when user want to exit from the application

import 'package:flutter/material.dart';

class Que_65_AlertBox extends StatefulWidget {
  const Que_65_AlertBox({super.key});

  @override
  State<Que_65_AlertBox> createState() => _Que_65_AlertBoxState();
}

class _Que_65_AlertBoxState extends State<Que_65_AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exit Application'),
      ),
      body: Container(
        child: Center(
            child: TextButton(
                onPressed: () {
                  ExitApp();
                },
                child: Text(
                  'Do you want to Exit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
      ),
    );
  }

  Future<void> ExitApp() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No')),
        ],
      ),
    );
  }
}
