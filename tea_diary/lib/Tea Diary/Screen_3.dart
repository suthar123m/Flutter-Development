import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_4.dart';
import 'package:tea_diary/Tea%20Diary/Screen_5.dart';
// import 'package:flutter1/tea_assesment/screem4.dart';
// import 'package:flutter1/tea_assesment/screen3_1.dart';

class managemenuitem extends StatefulWidget {
  const managemenuitem({super.key});

  @override
  State<managemenuitem> createState() => _managemenuitemState();
}

class _managemenuitemState extends State<managemenuitem> {
  List<String> list = ['Rambhai', 'Piyush', 'Mansi', 'Drashti'];

  //String dropdownValue = list.first;
  late String dropdownValue = list.first;

  bool isChecked = false;
  bool Ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Menu Item",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 224, 220, 220),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tea Seller",
                      style: TextStyle(color: Colors.brown, fontSize: 18),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    // Flexible(
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //         hintText: "Enter a Name", border: InputBorder.none),
                    //   ),
                    // ),
                    DropdownButton(
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        underline: Container(
                          height: 1,
                          width: 10,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Tea",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Checkbox(
                        checkColor: Colors.white,
                        fillColor:
                            MaterialStateProperty.resolveWith((states) => null),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Coffee",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 68,
                    ),
                    Checkbox(
                        checkColor: Colors.white,
                        fillColor:
                            MaterialStateProperty.resolveWith((states) => null),
                        value: Ischecked,
                        onChanged: (bool? value) {
                          setState(() {
                            Ischecked = value!;
                          });
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 470,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.brown,
                    ),
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => neworder()));
                            },
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ))),
                  ),
                  Container(
                    height: 45,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.brown,
                    ),
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.transparent),
                                            child: Column(
                                              children: [
                                                TextField(
                                                  decoration: InputDecoration(
                                                      hintText: "Amount",
                                                      labelText: "Enter Price:",
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    screen3_1(),
                                              )),
                                          child: const Text('OK'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    neworder(),
                                              )),
                                          child: const Text('Cancle'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Text(
                              "Add New Item",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ))),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
