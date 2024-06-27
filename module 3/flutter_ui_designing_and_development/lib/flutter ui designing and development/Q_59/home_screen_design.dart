import 'package:flutter/material.dart';

class MyUIScreenDesign extends StatefulWidget {
  const MyUIScreenDesign({super.key});

  @override
  State<MyUIScreenDesign> createState() => _MyUIScreenDesignState();
}

class _MyUIScreenDesignState extends State<MyUIScreenDesign> {
  List text = ['Recamended', 'Popular', 'Pizza', 'Noodels', 'Thali', 'Pasta'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 89, 89, 89),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(25),
                height: 40,
                width: double.maxFinite,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(Icons.arrow_back),
                      ),
                      Container(
                        child: Icon(Icons.search),
                      )
                    ])),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              height: 80,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 75,
                      width: 280,
                      child: Container(
                          child: Column(children: [
                        Container(
                          height: 35,
                          width: 270,
                          child: Text(
                            'Restaurant',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: 35,
                            width: 270,
                            child: Row(children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.black45),
                                child: Text(
                                  '20-30min',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Container(
                                  child: Text(
                                '2.4km Restaurant',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ))
                            ]))
                      ]))),
                  Container(
                    height: 75,
                    width: 80,
                    child: Image.asset('image/restaurentlogo.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: double.maxFinite,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Orange Sendwiches is delicious'),
                      ),
                      Container(
                          child: Row(children: [
                        Container(
                          child: Icon(Icons.star),
                        ),
                        Container(
                          child: Text('4.7'),
                        )
                      ]))
                    ])),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: text.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black12, width: 2)),
                    child: Center(child: Text(text[index])),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 20),
                    height: 80,
                    width: 80,
                    child: Image.asset('image/sobasoup.png'),
                  ),
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                            width: 100,
                            child: Text(
                              'Soba Soup',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                        Container(
                          width: 100,
                          child: Text(
                            'No. 1 in Salse',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12, color: Colors.yellow),
                          ),
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              '12',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                      ]))
                ])),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 20),
                    height: 80,
                    width: 80,
                    child: Image.asset('image/SaiUaSamunPhrai.png'),
                  ),
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                          width: 100,
                          child: Text(
                            'Sai Ua Samun Phrai',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            'No. 1 in Salse',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              '12',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                      ]))
                ])),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 20),
                    height: 80,
                    width: 80,
                    child: Image.asset('image/RatatulliePasta.png'),
                  ),
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                          width: 100,
                          child: Text(
                            'Ratatullie Pasta',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            'No. 1 in Salse',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                        Container(
                            width: 100,
                            child: Text(
                              '12',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                      ]))
                ])),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(22),
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: Colors.yellow[700],
                onPressed: () {},
                child: Icon(Icons.shopping_bag_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
