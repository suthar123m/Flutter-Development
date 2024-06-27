import 'package:flutter/material.dart';

class MySecondScreen extends StatefulWidget {
  const MySecondScreen({super.key});

  @override
  State<MySecondScreen> createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<MySecondScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.maxFinite,
                  color: Colors.yellow[800],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.arrow_back),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.topRight,
                        child: Icon(Icons.search),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 140),
                  height: 125,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80))),
                ),
                Positioned(
                    left: 125,
                    top: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(100),
                      child: Image.asset(
                        'image/SaiUaSamunPhrai.png',
                        scale: 0.86,
                      ),
                    )),
              ],
            ),
            Container(
              width: double.maxFinite,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                      child: Text(
                    'SaiUaSamunPhrai',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.watch_later_outlined,
                                    color: Colors.blue),
                              ),
                              Container(
                                child: Text(
                                  '50min',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '4.8',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.fireplace_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '325 Kcal',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black12),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Center(
                            child: Text(
                              '12',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.yellow[600]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: Text(
                                      '-',
                                      style: TextStyle(fontSize: 25),
                                    )),
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '+',
                                      style: TextStyle(fontSize: 25),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: 30, left: 30),
                    child: Text(
                      'Ingredienta',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: 50,
                              child: Image.asset(
                                'image/sobasoup.png',
                                scale: 4.5,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Noodles',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: 50,
                              child: Image.asset(
                                'image/dfdsfds.png',
                                scale: 4.5,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Scrimp',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: 50,
                              child: Image.asset(
                                'image/gsdfg.png',
                                scale: 4.5,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Egg',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 80,
                              width: 50,
                              child: Image.asset(
                                'image/sobasoup.png',
                                scale: 4.5,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Scallion',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      'About',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Text(
                      'A vibrant Thai sausage made with ground chicken, plus its spicy chili deep, from chef pranass savage of Atlatas Talat matket',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
