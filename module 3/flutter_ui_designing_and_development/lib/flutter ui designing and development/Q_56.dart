//  Write a program to show four images around Textview.

import 'package:flutter/material.dart';

class ImageTextViwe extends StatefulWidget {
  const ImageTextViwe({super.key});

  @override
  State<ImageTextViwe> createState() => _ImageTextViweState();
}

class _ImageTextViweState extends State<ImageTextViwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Text Viwe'),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('image/flutterlogo.png'),
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('image/flutterlogo.png'),
                      )),
                      Container(
                        height: 100,
                        width: 150,
                        child: Center(
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('image/flutterlogo.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('image/flutterlogo.png'),
                ),
              ],
            ),
          ),
        ));
  }
}
