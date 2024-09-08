import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // * Firebase Firestore for Comments

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> Status(String status) async {
    UserCredential? userCredential;

    User? user = userCredential!.user;

    try {
      await _firestore
          .collection('STATUS')
          .doc(user!.uid)
          .set({'Status': status});

      print('Status create');
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CircleAvatar(
              maxRadius: 120,
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1)),
                  )),
                  SizedBox(width: 30),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  SizedBox(width: 30),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text('Change Profile Image')),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     content: Container(
//                       height: 100,
//                       width: 100,
//                       child: Column(
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             child: Text('Write Status Here'),
//                           ),
//                           TextField()
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
