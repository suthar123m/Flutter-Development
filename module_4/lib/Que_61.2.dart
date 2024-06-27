import 'package:flutter/material.dart';
import 'package:module_4/Que_61.1.dart';

class Que_61_CartPage extends StatefulWidget {
  const Que_61_CartPage({super.key});

  @override
  State<Que_61_CartPage> createState() => _Que_61_CartPageState();
}

class _Que_61_CartPageState extends State<Que_61_CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        height: 50,
        width: double.maxFinite,
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Que_61_Homepage(),
              ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      Container(
        margin: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Text(
          'Cart',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Text(
          'Thu,6th of June',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Text(
          '+ add to cart',
          style: TextStyle(fontSize: 15),
        ),
      ),
      SizedBox(
        height: 15,
      ),

      // Item list
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 60,
          width: 60,
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUlDTsxS7sUFqw_W9_KkmqwWtt8_BNuOqXoQ&usqp=CAU'),
        ),
        Container(
            width: 200,
            child: Column(children: [
              Container(
                child: Text(
                  'vegetable and poached egg',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                  child: Text(
                '- 3 +',
                style: TextStyle(fontSize: 12),
              ))
            ])),
        Container(
            child: Column(children: [
          Container(
              child: Text(
            '7.2',
            style: TextStyle(fontSize: 10),
          )),
          Container(
            child: Icon(Icons.star),
          )
        ]))
      ])),
      SizedBox(
        height: 12,
      ),
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 60,
          width: 60,
          child: Image.network(
              'https://hips.hearstapps.com/hmg-prod/images/avocado-salad-1524672116.png?crop=0.667xw:1xh;center,top&resize=1200:*'),
        ),
        Container(
            width: 200,
            child: Column(children: [
              Container(
                child: Text(
                  'Avocado Salad',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                  child: Text(
                '- 1 +',
                style: TextStyle(fontSize: 12),
              ))
            ])),
        Container(
            child: Column(children: [
          Container(
              child: Text(
            '5.22',
            style: TextStyle(fontSize: 10),
          )),
          Container(
            child: Icon(Icons.star),
          )
        ]))
      ])),
      SizedBox(
        height: 12,
      ),
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 60,
          width: 60,
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK62GSZlxhbBCTGP1ldw97wXC4qwa1o2QwbQ&usqp=CAU'),
        ),
        Container(
            width: 200,
            child: Column(children: [
              Container(
                child: Text(
                  'pancakes',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                  child: Text(
                '- 2 +',
                style: TextStyle(fontSize: 12),
              ))
            ])),
        Container(
            child: Column(children: [
          Container(
              child: Text(
            '3.22',
            style: TextStyle(fontSize: 10),
          )),
          Container(
            child: Icon(Icons.star),
          )
        ]))
      ])),
      SizedBox(
        height: 12,
      ),
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 60,
          width: 60,
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIKMx4L7aEIysnWprJJWWjnh21UUtDXkWdow&usqp=CAU'),
        ),
        Container(
            width: 200,
            child: Column(children: [
              Container(
                  child: Text(
                'Vegitable Soup',
                style: TextStyle(fontSize: 15),
              )),
              SizedBox(
                height: 6,
              ),
              Container(
                  child: Text(
                '- 5 +',
                style: TextStyle(fontSize: 12),
              ))
            ])),
        Container(
            child: Column(children: [
          Container(
              child: Text(
            '2.56',
            style: TextStyle(fontSize: 10),
          )),
          Container(
            child: Icon(Icons.star),
          )
        ]))
      ]))
    ])));
  }
}
