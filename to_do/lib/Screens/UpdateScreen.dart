import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({
    super.key,
    required this.docId,
  });
  String docId;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteData() async {
    await _firestore.collection('TODO').doc(widget.docId).delete();
    Navigator.of(context).pop();
  }

  Future<void> getData() async {
    DocumentSnapshot getData =
        await _firestore.collection('TODO').doc(widget.docId).get();
    _titleController.text = getData['Title'];
    _descriptionController.text = getData['Subtitle'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> updateData() async {
    await _firestore.collection('TODO').doc(widget.docId).update({
      'Subtitle': _descriptionController.text.toString(),
      'Title': _titleController.text.toString(),
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 18,
            )),
        title: const Text(
          'UPDATE TODO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF224460),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                deleteData();
              },
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 43, 87, 123),
                  Color.fromARGB(255, 27, 53, 75),
                ])),
            child: Column(
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _titleController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter Task',
                        filled: true,
                        fillColor: Colors.black26,
                        hintStyle:
                            TextStyle(color: Colors.white38, letterSpacing: 2),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter Description',
                        filled: true,
                        fillColor: Colors.black26,
                        hintStyle:
                            TextStyle(color: Colors.white38, letterSpacing: 2),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    updateData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                          child: Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.white, letterSpacing: 3),
                      )),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
