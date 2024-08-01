import 'package:blood_bank/Admin%20Screen/update/BloodBankUpdateScreen.dart';
import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchBloodBankListScreen extends StatefulWidget {
  const SearchBloodBankListScreen({super.key});

  @override
  State<SearchBloodBankListScreen> createState() =>
      _SearchBloodBankListScreenState();
}

class _SearchBloodBankListScreenState extends State<SearchBloodBankListScreen> {
  TextEditingController controller = TextEditingController();

  // * Firestore

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteRecord(id) async {
    await _firestore.collection('AddBloodBank').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Delete Blood Bank Detail'),
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
          //           'SEARCH BLOOD BANK',
          //           style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //               letterSpacing: 3),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Detail of the Blood Bank Who Provide Blood form their Hostipal and Organigations .',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
              child: StreamBuilder(
            stream: _firestore.collection('AddBloodBank').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var BloodBankDetail = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: BloodBankDetail.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const DrawerMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteRecord(BloodBankDetail[index].id);
                            },
                            icon: Icons.delete,
                            foregroundColor: Colors.red,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              print('Edit');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BloodBankUpdateScreen(
                                        docId: BloodBankDetail[index].id),
                                  ));
                            },
                            icon: Icons.edit,
                            foregroundColor: Colors.black,
                          ),
                        ]),
                        child: Card(
                          color: Colors.lightBlue[300],
                          child: ListTile(
                            subtitle: Text(
                              'Blood Bank Name : \n'
                              '${BloodBankDetail[index]['BloodBankName']}\n\n'
                              'Blood Bank Address : \n'
                              '${BloodBankDetail[index]['BloodBankAddress']}',
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
          )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
