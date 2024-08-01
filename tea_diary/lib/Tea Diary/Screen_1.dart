import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_2.dart';
//import 'package:flutter1/Navigation/screen2.dart';
//import 'package:flutter1/tea_assesment/screen2222.dart';

class tea_diary extends StatefulWidget {
  const tea_diary({super.key});

  @override
  State<tea_diary> createState() => _tea_diaryState();
}

class _tea_diaryState extends State<tea_diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Tea Diary",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
      body: Container(
        color: Color.fromARGB(255, 224, 220, 220),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 230,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Tea/Coffee in",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("August",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
                Container(
                  height: 230,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Tea/Coffee in",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("August",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addnewseller(),
                        ));
                  },
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.people_sharp,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "Seller",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.apps,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "Item",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.person_2_sharp,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "Sellerwise Item",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.edit_sharp,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "New Order",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.calculate,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "Generate Bill",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 105,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Icon(
                          Icons.history,
                          color: Colors.brown,
                          size: 40,
                        ),
                        Text(
                          "Bill History",
                          style: TextStyle(color: Colors.brown),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.brown,
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}