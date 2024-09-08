import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('USER').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var myData = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
// * Document Snapshot for Get SINGLE DATA

                  DocumentSnapshot documentSnapshot = myData[index];
                  String imageUrl = documentSnapshot.get('Image');
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipOval(
                            child: imageUrl.isEmpty
                                ? Center(
                                    child: SpinKitCircle(
                                    color: Colors.blue[900],
                                    size: 40,
                                  ))
                                : Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      title: Text('${myData[index]['Username']}'),
                      subtitle: Text('${myData[index]['Contact']}'),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert_rounded),
                        onSelected: (value) {
                          if (value == 'Delete') {
                            print('Delete');
                          } else if (value == 'Edit') {
                            print('Edit');
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text('Delete'),
                              value: 'Delete',
                            ),
                            PopupMenuItem(
                              child: Text('Edit'),
                              value: 'Edit',
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
