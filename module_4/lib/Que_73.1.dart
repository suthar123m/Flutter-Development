import 'package:flutter/material.dart';
import 'package:module_4/Que_73.2.dart';

class MmySplashScreen extends StatefulWidget {
  const MmySplashScreen({super.key});

  @override
  State<MmySplashScreen> createState() => _MmySplashScreenState();
}

class _MmySplashScreenState extends State<MmySplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashScreen();
  }

  // Delayed Splash Screen for 5 seconds
  Future<void> SplashScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MySplashScreen_Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                'Weolcome to Splash Screen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Wait for 5 Seconds.......',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
