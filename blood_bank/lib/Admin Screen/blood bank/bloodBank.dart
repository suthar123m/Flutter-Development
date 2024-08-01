import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BloodBankScreen extends StatefulWidget {
  const BloodBankScreen({super.key});

  @override
  State<BloodBankScreen> createState() => _BloodBankScreenState();
}

class _BloodBankScreenState extends State<BloodBankScreen> {
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _bankAdressController = TextEditingController();

  // * Firebase Firestore Create Database of Add Blood Bank Detail

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> AddBloodBank(
    String BankName,
    String BankAddress,
  ) async {
    try {
      await _firestore.collection('AddBloodBank').add({
        'BloodBankName': BankName,
        'BloodBankAddress': BankAddress,
      });
      print('Created');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Add Doner Detail'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      print('Error');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank'),
      ),
      body: Column(
        children: [
          MyTextField(
              hintTaxt: 'Enter Blood Bank Name',
              LableText: 'Blood Bank Name',
              controller: _bankNameController),
          MyTextField(
              hintTaxt: 'Enter Blood Bank Address',
              LableText: 'Blood Bank Address',
              controller: _bankAdressController),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                AddBloodBank(_bankNameController.text.toString(),
                    _bankAdressController.text.toString());
                _bankNameController.clear();
                _bankAdressController.clear();
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
          ),
        ],
      ),
    );
  }
}
