import 'package:flutter/material.dart';
import 'package:tea_diary/Tea%20Diary/Screen_6.dart';
// import 'package:flutter1/tea_assesment/screen555.dart';

class neworder extends StatefulWidget {
  const neworder({
    super.key,
  });

  @override
  State<neworder> createState() => _neworderState();
}

class _neworderState extends State<neworder> {
  List<String> list = ['Rambhai', 'Piyush', 'Mansi', 'Drashti'];

  //String dropdownValue = list.first;
  late String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Order",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 224, 220, 220),
        child: Column(
          children: [
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
              padding: const EdgeInsets.only(left: 6, top: 1),
              child: Row(children: [
                Icon(Icons.calendar_today,
                    size: 27, color: const Color.fromARGB(255, 108, 106, 106)),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "18-5-2024",
                      style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 108, 106, 106)),
                    ),
                  ],
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Menu",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 8),
                          child: Text(
                            "ITEM",
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    const Color.fromARGB(255, 108, 106, 106)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 65),
                          child: Text("QUANTITY",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(
                                      255, 108, 106, 106))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 65),
                          child: Text("PRICE(₹)",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(
                                      255, 108, 106, 106))),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Tea",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 72,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 212, 210, 210)),
                            child: Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text("1"),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 212, 210, 210)),
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 108, 106, 106)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("10"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("="),
                        SizedBox(
                          width: 20,
                        ),
                        Text("10"),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Bounvita",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 28,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 212, 210, 210)),
                            child: Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("1"),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 212, 210, 210)),
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 108, 106, 106)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("25"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("="),
                        SizedBox(
                          width: 20,
                        ),
                        Text("25"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 10, top: 6, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            "₹ 35",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => billhistory(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        width: 125,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
