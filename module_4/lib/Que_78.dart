import 'package:flutter/material.dart';

class Que_78 extends StatefulWidget {
  const Que_78({super.key});

  @override
  State<Que_78> createState() => _Que_78State();
}

class _Que_78State extends State<Que_78> {
  TextEditingController _textcontroller = TextEditingController();
  List itemlist = [];
  bool edit_list = false;
  int currentindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Que 78 List'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            height: 50,
            width: 200,
            child: TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                hintText: 'Type Any..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Divider(
            indent: 100,
            endIndent: 100,
            color: Colors.black,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (edit_list) {
                  itemlist[currentindex] = _textcontroller.text.toString();
                } else {
                  itemlist.add(_textcontroller.text.toString());
                }
                _textcontroller.clear();
                edit_list = false;
                currentindex = -1;
              });
            },
            child: edit_list ? Text('Edit') : Text('Add'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentindex = index;
                      edit_list = true;
                      _textcontroller.text = itemlist[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        color: Colors.black12,
                        child: Center(
                            child: Text(
                          itemlist[index],
                          style: TextStyle(fontSize: 25),
                        )),
                      ),
                      onTap: () {
                        var alert = AlertDialog(
                          title: Text('Alert'),
                          content: Text('Choose you Option'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    var alert1 = AlertDialog(
                                      title: Text('Delete'),
                                      content: Text('Do you want to delete'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                setState(() {
                                                  itemlist.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text('Yes')),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text('No')),
                                      ],
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (context) => alert1,
                                    );
                                  });
                                },
                                child: Text('Delete')),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    currentindex = index;
                                    _textcontroller.text =
                                        itemlist[index].toString();
                                    edit_list = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Edit')),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Exit')),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) => alert,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
