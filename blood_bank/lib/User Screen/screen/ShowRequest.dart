import 'package:blood_bank/Admin%20Screen/update/RequestUpdate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowRequestScreen extends StatefulWidget {
  const ShowRequestScreen({super.key});

  @override
  State<ShowRequestScreen> createState() => _ShowRequestScreenState();
}

class _ShowRequestScreenState extends State<ShowRequestScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteData(id) async {
    await _firestore.collection('DonerRequest').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Delete Doner Request Detail'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Request'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Shaw the Request Form the Doner\nwho wants to Donate the blood .',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: StreamBuilder(
            stream: _firestore.collection('DonerRequest').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var requestDetail = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: requestDetail.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const DrawerMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteData(requestDetail[index].id);
                            },
                            icon: Icons.delete,
                            foregroundColor: Colors.red,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RequestUpdateScreen(
                                        docId: requestDetail[index].id),
                                  ));
                            },
                            icon: Icons.edit,
                            foregroundColor: Colors.black,
                          ),
                        ]),
                        child: Card(
                          color: Colors.lightBlue[300],
                          child: ListTile(
                            title: Text(
                              'Name :  ${requestDetail[index]['DonerName']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text(
                              'Address : ${requestDetail[index]['DonerAddress']}\n'
                              'Contact : ${requestDetail[index]['DonerContact']}\n'
                              'Blood Group : ${requestDetail[index]['DonerBloodGroup']}\n'
                              'Age : ${requestDetail[index]['DonerAge']}',
                              style: TextStyle(color: Colors.black),
                            ),
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
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
