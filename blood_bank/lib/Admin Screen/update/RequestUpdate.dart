import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestUpdateScreen extends StatefulWidget {
  RequestUpdateScreen({
    super.key,
    required this.docId,
  });
  String docId;
  @override
  State<RequestUpdateScreen> createState() => _RequestUpdateScreenState();
}

class _RequestUpdateScreenState extends State<RequestUpdateScreen> {
  TextEditingController _donerNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('DonerRequest').doc(widget.docId).get();

    _donerNameController.text = documentSnapshot['DonerName'];
    _bloodGroupController.text = documentSnapshot['DonerBloodGroup'];
    _contactController.text = documentSnapshot['DonerContact'];
    _ageController.text = documentSnapshot['DonerAge'];
    _addressController.text = documentSnapshot['DonerAddress'];
  }

  Future<void> updateData() async {
    await _firestore.collection('DonerRequest').doc(widget.docId).update({
      'DonerName': _donerNameController.text,
      'DonerBloodGroup': _bloodGroupController.text,
      'DonerContact': _contactController.text,
      'DonerAge': _ageController.text,
      'DonerAddress': _addressController.text,
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
      appBar: AppBar(
        title: Text('Request Upadate'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              MyTextField(
                  hintTaxt: 'Enter Doner Name',
                  LableText: 'Doner Name',
                  controller: _donerNameController),
              MyTextField(
                  hintTaxt: 'Enter Doner Blood Group',
                  LableText: 'Doner Blood Group',
                  controller: _bloodGroupController),
              MyTextField(
                  hintTaxt: 'Enter Doner Contact',
                  LableText: 'Doner Contact',
                  controller: _contactController),
              MyTextField(
                  hintTaxt: 'Enter Doner Age',
                  LableText: 'Doner Age',
                  controller: _ageController),
              MyTextField(
                  hintTaxt: 'Enter Doner Address',
                  LableText: 'Doner Address',
                  controller: _addressController),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    updateData();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade500,
                          Colors.lightBlue.shade200
                        ]),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1)),
                    child: const Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
