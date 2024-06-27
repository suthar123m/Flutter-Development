import 'package:flutter/material.dart';

class MyAssignment_1 extends StatelessWidget {
  const MyAssignment_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assignent - 1",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: double.maxFinite,
              color: Colors.red,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    height: 230,
                    width: 230,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    height: 230,
                    width: 230,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 230,
                    width: 230,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 230,
                    width: 230,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: 150,
                    color: Colors.yellow,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
