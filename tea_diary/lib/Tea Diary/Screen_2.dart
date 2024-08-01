import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_3.dart';
//import 'package:flutter1/tea_assesment/screen3_1.dart';

class addnewseller extends StatefulWidget {
  const addnewseller({super.key});

  @override
  State<addnewseller> createState() => _addnewsellerState();
}

class _addnewsellerState extends State<addnewseller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Seller List",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Add New Seller",
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent),
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter a Name",
                                      labelText: "Name",
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: "Mobile",
                                        hintText: "Enter a Number"),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "Enter a Address",
                                        labelText: "Address"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => managemenuitem(),
                                )),
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 45,
              ))
        ],
      ),
    );
  }
}
//