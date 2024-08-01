import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  TextEditingController _donerNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // * Doner Request Add by Firebase Firestore

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> AddDonerRequest(String name, String bloodGroup, String contact,
      String age, String address) async {
    try {
      await _firestore.collection('DonerRequest').add({
        'DonerName': name,
        'DonerBloodGroup': bloodGroup,
        'DonerContact': contact,
        'DonerAge': age,
        'DonerAddress': address,
      });

      print('Created');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Add Doner Request'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Request for Blood Donation',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'If you want to add Blood Donation\nPlease fill the form',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
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
                  AddDonerRequest(
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
        ),
      )),
    );
  }
}
