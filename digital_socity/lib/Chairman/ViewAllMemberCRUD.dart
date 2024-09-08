import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_socity/Chairman/UpdateMember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ViewAndUpdateAllMember extends StatefulWidget {
  const ViewAndUpdateAllMember({super.key});

  @override
  State<ViewAndUpdateAllMember> createState() => _ViewAndUpdateAllMemberState();
}

class _ViewAndUpdateAllMemberState extends State<ViewAndUpdateAllMember> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> delete(id) async {
    await _firestore.collection('Member').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Member Detail'),
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
                          child: Slidable(
                            startActionPane:
                                ActionPane(motion: DrawerMotion(), children: [
                              SlidableAction(
                                onPressed: (context) {
                                  delete(userData[index].id);
                                },
                                icon: Icons.delete,
                                foregroundColor: Colors.red,
                                backgroundColor: Colors.transparent,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateAllMember(
                                          docId: userData[index].id,
                                        ),
                                      ));
                                },
                                icon: Icons.edit,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.transparent,
                              ),
                            ]),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                    'Name : ${userData[index]['username']}'),
                                subtitle: Text(
                                    'Email : ${userData[index]['email']}\n'
                                    'Phone Number : ${userData[index]['phoneNumber']}\n'
                                    'Member : ${userData[index]['Member']}'),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
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
