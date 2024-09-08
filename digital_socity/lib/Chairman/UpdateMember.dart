
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_socity/customWidget/elevatedButton.dart';
import 'package:digital_socity/customWidget/textField.dart';
import 'package:flutter/material.dart';

class UpdateAllMember extends StatefulWidget {
  UpdateAllMember({
    super.key,
    required this.docId,
  });
  String docId;

  @override
  State<UpdateAllMember> createState() => _UpdateAllMemberState();
}

class _UpdateAllMemberState extends State<UpdateAllMember> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _memberControllre = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('Member').doc(widget.docId).get();

    _nameController.text = documentSnapshot['username'];
    _emailController.text = documentSnapshot['email'];
    _phonenumberController.text = documentSnapshot['phoneNumber'];
    _memberControllre.text = documentSnapshot['Member'];
  }

  Future<void> update() async {
    await _firestore.collection('Member').doc(widget.docId).update({
      'username': _nameController.text.toString(),
      'email': _emailController.text.toString(),
      'phoneNumber': _phonenumberController.text.toString(),
      'Member': _memberControllre.text.toString(),
    });
    Navigator.of(context).pop();
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
        title: Text('Update Member Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 25),
                MyTextField(
                    Controller: _nameController,
                    hintText: 'Enter Username',
                    validatorText: ''),
                const SizedBox(height: 25),
                MyTextField(
                    Controller: _emailController,
                    hintText: 'Enter Email',
                    validatorText: ''),
                const SizedBox(height: 25),
                MyTextField(
                    Controller: _phonenumberController,
                    hintText: 'Enter Phone Number',
                    validatorText: ''),
                const SizedBox(height: 25),
                MyTextField(
                    Controller: _memberControllre,
                    hintText: 'Enter Member',
                    validatorText: ''),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    update();
                    print('Update');
                  },
                  child: MyEleButton(
                      eleColor: Colors.blue,
                      eleText: 'UPDATE',
                      eleBorder: Colors.black,
                      fontColor: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
