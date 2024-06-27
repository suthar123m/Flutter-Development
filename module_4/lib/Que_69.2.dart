import 'package:flutter/material.dart';
import 'package:module_4/Que_69.3.dart';

class MyIndexScreen extends StatefulWidget {
  const MyIndexScreen({super.key});

  @override
  State<MyIndexScreen> createState() => MyIndexScreenState();
}

class MyIndexScreenState extends State<MyIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Email Subject $index'),
            subtitle: Text('Sender : Mahendrasuthar7425@gmail.com'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyEmailScreen(index),
                  ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
