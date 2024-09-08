import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ViewAllMember extends StatefulWidget {
  const ViewAllMember({super.key});

  @override
  State<ViewAllMember> createState() => _ViewAllMemberState();
}

class _ViewAllMemberState extends State<ViewAllMember> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Member'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Member').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List userData = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            child: ListTile(
                              title:
                                  Text('Name : ${userData[index]['username']}'),
                              subtitle: Text(
                                  'Email : ${userData[index]['email']}\n'
                                  'Phone Number : ${userData[index]['phoneNumber']}\n'
                                  'Member : ${userData[index]['Member']}'),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: SpinKitThreeInOut(
                      color: Colors.black,
                      size: 30,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
