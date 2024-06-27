import 'package:flutter/material.dart';

class MyChechBox extends StatefulWidget {
  const MyChechBox({super.key});

  @override
  State<MyChechBox> createState() => My_ChechBoxState();
}

class My_ChechBoxState extends State<MyChechBox> {
  bool? isVisible = false;
  String? textdisplay = "Unhide";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chech Box Check'),
      ),
      body: Column(
        children: [
          Visibility(
            visible: isVisible!,
            child: Text("Hello welcome ")),
          CheckboxListTile(
            title: Text(textdisplay!),
            value: isVisible, onChanged: (value) {
              setState(() {
                if(isVisible==true)
                {
                  isVisible = false;
                  textdisplay = "Unhide";
                }
                else
                {
                  isVisible = true;
                  textdisplay = "Hide";
                }
                print(isVisible);
              });
            },)
        ],
      ),
    );
  }
}
