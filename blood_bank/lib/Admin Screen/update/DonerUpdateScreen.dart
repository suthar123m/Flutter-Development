import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonerUpdateDetail extends StatefulWidget {
  DonerUpdateDetail({
    super.key,
    required this.docId,
  });

  String docId;
  @override
  State<DonerUpdateDetail> createState() => _DonerUpdateDetailState();
}

class _DonerUpdateDetailState extends State<DonerUpdateDetail> {
  TextEditingController _donerNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getdata() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('AddDoner').doc(widget.docId).get();

    _donerNameController.text = documentSnapshot['DonerName'];
    _bloodGroupController.text = documentSnapshot['BloodGroup'];
    _contactController.text = documentSnapshot['Contact'];
    _ageController.text = documentSnapshot['Age'];
    _addressController.text = documentSnapshot['Address'];
  }

  Future<void> updateData() async {
    await _firestore.collection('AddDoner').doc(widget.docId).update({
      'DonerName': _donerNameController.text,
      'BloodGroup': _bloodGroupController.text,
      'Contact': _contactController.text,
      'Age': _ageController.text,
      'Address': _addressController.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doner Detail Update'),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          const SizedBox(height: 30),
          MyTextField(
              hintTaxt: 'Enter Donor Name',
              LableText: 'Name',
              controller: _donerNameController),
          MyTextField(
              hintTaxt: 'Enter Blood Group',
              LableText: 'Blood Group',
              controller: _bloodGroupController),
          MyTextField(
              hintTaxt: 'Enter Contact',
              LableText: 'Contact',
              controller: _contactController),
          MyTextField(
              hintTaxt: 'Enter Age',
              LableText: 'Age',
              controller: _ageController),
          MyTextField(
              hintTaxt: 'Enter Donor Address',
              LableText: 'Address',
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
      ))),
    );
  }
}
