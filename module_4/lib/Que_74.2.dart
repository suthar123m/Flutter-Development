import 'package:flutter/material.dart';

class MySecondScreem extends StatefulWidget {
  MySecondScreem({super.key, this.message});
  String? message;
  @override
  State<MySecondScreem> createState() => _MySecondScreemState();
}

class _MySecondScreemState extends State<MySecondScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 100,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              widget.message!,
              style: TextStyle(fontSize: 20),
            )),
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
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text('Press for back'))
        ],
      ),
    );
  }
}
