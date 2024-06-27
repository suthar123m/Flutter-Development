import 'package:flutter/material.dart';

class Que68 extends StatefulWidget {
  const Que68({Key? key}) : super(key: key);

  @override
  State<Que68> createState() => _Que68State();
}

class _Que68State extends State<Que68> {
  TextEditingController _textController = TextEditingController();
  List<String> itemList = [];
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Que 68 List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter any...',
              ),
            ),
          ),
          index != null
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemList[index!] = _textController.text;
                      index = null;
                      _textController.clear();
                    });
                  },
                  child: Text('Edit'),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemList.add(_textController.text);
                      _textController.clear();
                    });
                  },
                  child: Text('Add'),
                ),
          SizedBox(height: 15),
          Divider(
            color: Colors.black,
            indent: 100,
            endIndent: 100,
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          itemList[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('View'),
                            onTap: () {
                              setState(() {
                                _textController.text = itemList[index];
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Edit'),
                            onTap: () {
                              setState(() {
                                _textController.text = itemList[index];
                                this.index = index;
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Delete'),
                            onTap: () {
                              setState(() {
                                itemList.removeAt(index);
                              });
                            },
                          )
                        ],
                      ),
                    ],
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
