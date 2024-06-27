import 'package:flutter/material.dart';
import 'login_page.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({super.key});

  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          height: 40,
          width: double.maxFinite,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyLoginUipage(),
                  ));
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          height: 300,
          width: 300,
          child: Image.asset('image/flutterlogo.png'),
        )
      ],
    ));
  }
}
