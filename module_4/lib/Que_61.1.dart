import 'package:flutter/material.dart';
import 'package:module_4/Que_61.2.dart';

class Que_61_Homepage extends StatefulWidget {
  const Que_61_Homepage({super.key});

  @override
  State<Que_61_Homepage> createState() => _Que_61_HomepageState();
}

class _Que_61_HomepageState extends State<Que_61_Homepage> {
  List text = [
    'Chicken Burger',
    'Avocado Salad',
    'Vwgitable soup',
    'Ice Cream'
  ];
  List Text_2 = [
    'All',
    'Salad',
    'Pizza',
    'Burger',
    'Sendwich',
    'Momos',
    'dabeli',
    'Pasta'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 40,
                  width: 300,
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.search),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.filter_list_alt),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              child: ListView.builder(
                itemCount: text.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12, width: 2)),
                      child: Center(child: Text(text[index])));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              child: ListView.builder(
                itemCount: Text_2.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        Text_2[index],
                        style: TextStyle(fontSize: 18),
                      )));
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // for First Image
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: 200,
                    child: Column(
                      children: [
                        // for image
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: double.maxFinite,
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUlDTsxS7sUFqw_W9_KkmqwWtt8_BNuOqXoQ&usqp=CAU'),
                        ),
                        // for item name
                        Container(
                          child: Text(
                            'vegetable and poached egg',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        // for star rating
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                              ],
                            )),
                        Container(
                          child: Text('13.50 '),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // for First Image
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: 200,
                    child: Column(
                      children: [
                        // for image
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: double.maxFinite,
                          child: Image.network(
                              'https://hips.hearstapps.com/hmg-prod/images/avocado-salad-1524672116.png?crop=0.667xw:1xh;center,top&resize=1200:*'),
                        ),
                        // for item name
                        Container(
                          child: Text(
                            'Avocado Salad',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        // for star rating
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                              ],
                            )),
                        Container(
                          child: Text('19.56 '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // for First Image
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: 200,
                    child: Column(
                      children: [
                        // for image
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: double.maxFinite,
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK62GSZlxhbBCTGP1ldw97wXC4qwa1o2QwbQ&usqp=CAU'),
                        ),
                        // for item name
                        Container(
                          child: Text(
                            'pancakes',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        // for star rating
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                              ],
                            )),
                        Container(
                          child: Text('20.20 '),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // for First Image
                    margin: EdgeInsets.all(15),
                    height: 300,
                    width: 200,
                    child: Column(
                      children: [
                        // for image
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: double.maxFinite,
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIKMx4L7aEIysnWprJJWWjnh21UUtDXkWdow&usqp=CAU'),
                        ),
                        // for item name
                        Container(
                          child: Text(
                            'Vegitable Soup',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        // for star rating
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                                Container(
                                  child: Icon(Icons.star, color: Colors.black),
                                ),
                              ],
                            )),
                        Container(
                          child: Text('13.50 '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 40,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 650,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Your Order',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(Icons.delete),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                indent: 50,
                                endIndent: 50,
                              ),
                              Container(
                                height: 50,
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Chicken Burger',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: Text('250 g'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '7.00',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Avocado Salad',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: Text('350 g'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '5.22',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(indent: 50, endIndent: 50),
                              Container(
                                height: 50,
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Container(
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '12.22',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 50,
                                width: 120,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Que_61_CartPage(),
                                          ));
                                    },
                                    child: Text('Add to Cart')),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
