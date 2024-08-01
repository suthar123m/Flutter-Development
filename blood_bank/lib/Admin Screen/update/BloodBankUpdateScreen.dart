import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BloodBankUpdateScreen extends StatefulWidget {
  BloodBankUpdateScreen({
    super.key,
    required this.docId,
  });

  String docId;

  @override
  State<BloodBankUpdateScreen> createState() => _BloodBankUpdateScreenState();
}

class _BloodBankUpdateScreenState extends State<BloodBankUpdateScreen> {
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _bankAdressController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot snapshot =
        await _firestore.collection('AddBloodBank').doc(widget.docId).get();

    print('=============  Doc Id => ${widget.docId}');

    _bankNameController.text = snapshot['BloodBankName'];
    _bankAdressController.text = snapshot['BloodBankAddress'];
  }

  Future<void> updateData() async {
    await _firestore.collection('AddBloodBank').doc(widget.docId).update({
      "BloodBankName": _bankNameController.text,
      "BloodBankAddress": _bankAdressController.text
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
        title: Text('Blood Bank Detail Update'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
