import 'package:flutter/material.dart';

class MySnackBaar extends StatefulWidget {
  const MySnackBaar({super.key});

  @override
  State<MySnackBaar> createState() => _MySnackBaarState();
}

class _MySnackBaarState extends State<MySnackBaar> {
  void SnackBaar(BuildContext context, String message) {
    var SnackBaar = SnackBar(
      content: Text('$message'),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBaar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Baar'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 32,
                width: 230,
                child: ElevatedButton(
                    onPressed: () {
                      SnackBaar(context, 'Snack baar App Resumed');
                    },
                    child: Text('App Resumed')),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Container(
                height: 32,
                width: 230,
                child: ElevatedButton(
                    onPressed: () {
                      SnackBaar(context, 'Snack baar App Inactive');
                    },
                    child: Text('App Inactive')),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Container(
                height: 32,
                width: 230,
                child: ElevatedButton(
                    onPressed: () {
                      SnackBaar(context, 'Snack baar App Paused');
                    },
                    child: Text('App Paused')),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Container(
                height: 32,
                width: 230,
                child: ElevatedButton(
                    onPressed: () {
                      SnackBaar(context, 'Snack baar App Detached');
                    },
                    child: Text('App Detached')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
