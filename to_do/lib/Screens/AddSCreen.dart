import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isloaing = false;

  Future<void> addTODO(
    String title,
    String subtitle,
  ) async {
    setState(() {
      _isloaing = true;
    });
    try {
      DateTime now = DateTime.now();
      DateTime dateOnly = DateTime(now.year, now.month, now.day);
      Timestamp timestamp = Timestamp.fromDate(dateOnly);
      await _firestore.collection('TODO').add({
        'Title': title,
        'Subtitle': subtitle,
        'Date': timestamp,
        // 'Complete': false,
      });
      setState(() {
        _isloaing = false;
      });
      print('=====================================   Create');
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _isloaing = false;
      });
      print('=====================================   Error');
    }
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
          'ADD TODO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF224460),
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Add your Daily Task ..',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                _isloaing
                    ? Center(
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          addTODO(
                            _titleController.text.toString(),
                            _descriptionController.text.toString(),
                          );
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
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 3),
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
