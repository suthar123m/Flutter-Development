import 'package:flutter/material.dart';

class RadioColorChange extends StatefulWidget {
  const RadioColorChange({super.key});

  @override
  State<RadioColorChange> createState() => _RadioColorChangeState();
}

class _RadioColorChangeState extends State<RadioColorChange> {
  Color? colorname = Colors.white;
  String colorchange = "";
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorname,
        appBar: AppBar(
          title: Text('Radio Color Change'),
        ),
        body: Center(
          child: Column(
            children: [
              RadioListTile(
                value: "Red",
                title: Text('Red Color'),
                groupValue: colorchange,
                onChanged: (value) {
                  setState(() {
                    colorchange = value as String;
                    if (status == false) {
                      colorname = Colors.red;
                      status = true;
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: "Blue",
                title: Text('Blue Color'),
                groupValue: colorchange,
                onChanged: (value) {
                  setState(() {
                    colorchange = value as String;
                    if (status == true) {
                      colorname = Colors.blue;
                      status = false;
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: "Teal",
                title: Text('Teal Color'),
                groupValue: colorchange,
                onChanged: (value) {
                  setState(() {
                    colorchange = value as String;
                    if (status == false) {
                      colorname = Colors.teal;
                      status = true;
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: "Yello",
                title: Text('Yello Color'),
                groupValue: colorchange,
                onChanged: (value) {
                  setState(() {
                    colorchange = value as String;
                    if (status == true) {
                      colorname = Colors.yellow;
                      status = false;
                    }
                  });
                },
              ),
            ],
          ),
        ));
  }
}
