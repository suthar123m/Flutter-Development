import 'package:blood_bank/Admin%20Screen/update/DonerUpdateScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchDonerListScreen extends StatefulWidget {
  const SearchDonerListScreen({super.key});

  @override
  State<SearchDonerListScreen> createState() => _SearchDonerListScreenState();
}

class _SearchDonerListScreenState extends State<SearchDonerListScreen> {
  TextEditingController controller = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> deleteRecord(id) async {
    await _firestore.collection('AddDoner').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Delete Doner Detail'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          // const SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: GestureDetector(
          //     onTap: () {
          //       // * Show Snackbaar
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //         content: Text('Detail Search'),
          //         duration: Duration(seconds: 1),
          //       ));

          //       // * Add Blood Doner Detail by Sqflite Database
          //     },
          //     child: Container(
          //       height: 65,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(colors: [
          //             Colors.blue.shade500,
          //             Colors.lightBlue.shade200
          //           ]),
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(width: 1)),
          //       child: const Center(
          //         child: Text(
          //           'SEARCH DONER',
          //           style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //               letterSpacing: 3),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

// Detail of the Doner Who Wants to Donate their Blood
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Detail of the Doner Who Wants to Donate their Blood.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('AddDoner').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var donerDetail = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: donerDetail.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: Slidable(
                          startActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    deleteRecord(donerDetail[index].id);
                                  },
                                  icon: Icons.delete,
                                  foregroundColor: Colors.red,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DonerUpdateDetail(
                                            docId: donerDetail[index].id,
                                          ),
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
                                'Name :  ${donerDetail[index]['DonerName']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                'Address : ${donerDetail[index]['Address']}\n'
                                'Contact : ${donerDetail[index]['Contact']}\n'
                                'Blood Group : ${donerDetail[index]['BloodGroup']}\n'
                                'Age : ${donerDetail[index]['Age']}',
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
                ));
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
