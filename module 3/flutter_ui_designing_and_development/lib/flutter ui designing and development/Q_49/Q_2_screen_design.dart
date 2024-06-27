import 'package:flutter/material.dart';

class Myassignment_2 extends StatelessWidget {
  const Myassignment_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assignment - 2",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('image/image.jpeg'),
              ),
            ),
            Container(
              height: 80,
              width: double.maxFinite,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 400,
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          "Oeschinen Lake Campground",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 400,
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Text(
                          "Kanderdsteg Switzerland",
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 100,
                    child: Row(
                      children: [
                        Container(
                            child: Icon(
                          Icons.star,
                          color: Colors.red,
                        )),
                        Container(
                          child: Text("4.1"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                color: Colors.blue,
                              )),
                        ),
                        Container(
                          child: Text(
                            "Call",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.telegram,
                                color: Colors.blue,
                              )),
                        ),
                        Container(
                          child: Text(
                            "Route",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.blue,
                              )),
                        ),
                        Container(
                          child: Text(
                            "Share",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              padding: EdgeInsets.fromLTRB(50, 40, 50, 0),
              child: Center(
                child: Text(
                  "Lake Oeschinen lines at the foot of the Boiemlishlp in the baernese Alps. Situted 1.578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour wakl through pastures and pine forest, leads you to the lake, which warns to 20 degrees Celcius in the summer. Activities enjoyed here include rowing. and riding the summer toboggea run . ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
