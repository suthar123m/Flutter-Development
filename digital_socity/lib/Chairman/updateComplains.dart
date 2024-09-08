import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_socity/customWidget/textField.dart';
import 'package:flutter/material.dart';

class UpdateCoplains extends StatefulWidget {
  UpdateCoplains({
    super.key,
    required this.docId,
  });

  String docId;
  @override
  State<UpdateCoplains> createState() => _UpdateCoplainsState();
}

class _UpdateCoplainsState extends State<UpdateCoplains> {
  TextEditingController _updateConplainsController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('Complains').doc(widget.docId).get();
    _updateConplainsController.text = documentSnapshot['Complains'];
  }

  Future<void> update() async {
    await _firestore.collection('Complains').doc(widget.docId).update({
      'Complains': _updateConplainsController.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black26,
        child: Center(
          child: Container(
            height: 300,
            width: 250,
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Update Complains',
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _updateConplainsController,
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Update Complains',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            update();
                            Navigator.of(context).pop();
                          },
                          child: Text('Update')),
                      const SizedBox(width: 5),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      const SizedBox(width: 10)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
