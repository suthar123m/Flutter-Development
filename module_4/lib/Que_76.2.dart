import 'package:flutter/material.dart';

class Que_76_2 extends StatefulWidget {
  Que_76_2({super.key, this.num_1, this.num_2});
  var num_1;
  var num_2;

  @override
  State<Que_76_2> createState() => _Que_76_2State();
}

class _Que_76_2State extends State<Que_76_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            'Addition == ${widget.num_1 + widget.num_2}',
            style: TextStyle(fontSize: 18),
          )),
        ),
      ),
    );
  }
}
