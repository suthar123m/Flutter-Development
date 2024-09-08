import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_socity/Society%20Member/ViewAllMember.dart';
import 'package:digital_socity/customWidget/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SocietyMemberDashboard extends StatefulWidget {
  SocietyMemberDashboard({
    super.key,
    required this.username,
  });
  String username;

  @override
  State<SocietyMemberDashboard> createState() => _SocietyMemberDashboardState();
}

class _SocietyMemberDashboardState extends State<SocietyMemberDashboard> {
  TextEditingController _complainController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Complains(String Complains) async {
    try {
      await _firestore.collection('Complains').add({
        'Complains': Complains,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Complains Added'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future<void> Complaindelete(id) async {
    await _firestore.collection('Complains').doc(id).delete();
  }

  Future<void> logout() async {
    await _auth.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                    child: Text(
                      'Society Member : ${widget.username}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View All Member',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewAllMember(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ))),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                        Controller: _complainController,
                        hintText: 'Add Complains Here..',
                        validatorText: ''),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Complains(_complainController.text.toString());
                      _complainController.clear();
                    },
                    child: Container(
                      height: 56,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Complains',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  child: StreamBuilder(
                    stream: _firestore.collection('Complains').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List complains = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: complains.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: ListTile(
                                  leading: Icon(Icons.arrow_right_outlined),
                                  title: Text(
                                    '${complains[index]['Complains']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ));
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
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Notice',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  child: StreamBuilder(
                    stream: _firestore.collection('Notice').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List notice = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: notice.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: ListTile(
                                  leading: Icon(Icons.arrow_right_outlined),
                                  title: Text(
                                    '${notice[index]['Notice']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ));
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
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
        onPressed: () {
          logout();
        },
      ),
    );
  }
}
