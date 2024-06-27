import 'package:flutter/material.dart';

class ColorChange extends StatefulWidget {
  const ColorChange({super.key});

  @override
  State<ColorChange> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  Color colorname = Colors.white;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorname,
      appBar: AppBar(
        title: Text('Color Change'),
      ),
      body: Center(
        child: Container(
          height: 30,
          width: 100,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (status == false) {
                    colorname = Colors.blueGrey;
                    status = true;
                  } else {
                    colorname = Colors.brown;
                    status = false;
                  }
                });
              },
              child: Text('Click')),
        ),
      ),
    );
  }
}
