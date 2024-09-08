import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateNotice extends StatefulWidget {
  UpdateNotice({
    super.key,
    required this.docId,
  });
  String docId;

  @override
  State<UpdateNotice> createState() => _UpdateNoticeState();
}

class _UpdateNoticeState extends State<UpdateNotice> {
  TextEditingController _updateNoticeController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('Notice').doc(widget.docId).get();
    _updateNoticeController.text = documentSnapshot['Notice'];
  }

  Future<void> updateNotice() async {
    await _firestore.collection('Notice').doc(widget.docId).update({
      'Notice': _updateNoticeController.text.toString(),
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
                    'Update Notice',
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _updateNoticeController,
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Update Notice',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            updateNotice();
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
