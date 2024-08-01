import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('USER').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var requestDetail = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: requestDetail.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: Card(
                          color: Colors.lightBlue[300],
                          child: ListTile(
                            title: Text(
                              'Name :  ${requestDetail[index]['Username']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text(
                              'Email : ${requestDetail[index]['Email']}\n'
                              'Contact : ${requestDetail[index]['Contact']}\n'
                              'Member : ${requestDetail[index]['Member']}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                    child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50,
                ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
