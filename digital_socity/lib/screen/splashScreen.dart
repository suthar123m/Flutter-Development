import 'dart:async';

import 'package:digital_socity/Auth/loginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  'https://media.istockphoto.com/id/1203934314/photo/diverse-team-meeting.jpg?s=612x612&w=0&k=20&c=hiTvatitmAFcAsOnCdFk3XMz5ZPTltrmCYE1pBE6wJ0=',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                  bottom: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: Text(
                        'DIGITAL\n   SOCIETY',
                        style: TextStyle(
                            height: 1.1,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
