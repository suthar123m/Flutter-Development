import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddDonerScreen extends StatefulWidget {
  const AddDonerScreen({super.key});

  @override
  State<AddDonerScreen> createState() => _AddDonerScreenState();
}

class _AddDonerScreenState extends State<AddDonerScreen> {
  TextEditingController _donerNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // * Firebase Firestore Create Database of Add Doner detail

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> AddDoner(
    String donername,
    String bloodGroup,
    String contact,
    String age,
    String address,
  ) async {
    try {
      await _firestore.collection('AddDoner').add({
        'DonerName': donername,
        'BloodGroup': bloodGroup,
        'Contact': contact,
        'Age': age,
        'Address': address,
      });
      print('Created');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Add Doner Detail'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      print('Error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Doner Detail'),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
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
                AddDoner(
                    _donerNameController.text.toString(),
                    _bloodGroupController.text.toString(),
                    _contactController.text.toString(),
                    _ageController.text.toString(),
                    _addressController.text.toString());
                _donerNameController.clear();
                _bloodGroupController.clear();
                _contactController.clear();
                _ageController.clear();
                _addressController.clear();
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

// * Add Doner Detail by Using Sqflite Database
}
