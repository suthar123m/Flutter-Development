import 'package:flutter/material.dart';
import 'Que_74.2.dart';

class MyFirstScreenPage extends StatefulWidget {
  const MyFirstScreenPage({super.key});

  @override
  State<MyFirstScreenPage> createState() => _MyFirstScreenPageState();
}

class _MyFirstScreenPageState extends State<MyFirstScreenPage> {
  TextEditingController _namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              height: 60,
              width: 250,
              child: TextField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Enter Any..',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(color: Colors.black, indent: 100, endIndent: 100),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                String? msg = _namecontroller.text.toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySecondScreem(message: msg),
                    ));
                _namecontroller.clear();
              },
              child: Text('Click Hear'))
        ],
      ),
    );
  }
}
