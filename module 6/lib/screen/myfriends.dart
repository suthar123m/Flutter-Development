import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/screen/dashboardscreen.dart';
import 'package:flutter/material.dart';

class MyFRIENDS extends StatefulWidget {
  final User? user;

  MyFRIENDS({required this.user});

  State<MyFRIENDS> createState() => _MyFRIENDSScreenState();
}

class _MyFRIENDSScreenState extends State<MyFRIENDS> {
  String? logged_username;
  var querySnapshot;
  String? documnet_id;
  List<String> documentIds = [];
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      logged_username = document["name"];
    });
  }

  Future<bool> isFriendRequestAdded(String? receiverId) async {
    querySnapshot = await FirebaseFirestore.instance
        .collection("Friends")
        .where("receiver_id", isEqualTo: widget.user!.uid)
        .where("request_id", isEqualTo: receiverId)
        .where("status", isEqualTo: "pending")
        .get();

   
    return querySnapshot.docs.isNotEmpty;
  }
   Future<bool> FriendsAdd (String? receiverId) async {
   var querySnapshot = await FirebaseFirestore.instance
      .collection("Friends")
      .where("status", isEqualTo: "accepted")
      .where("request_id", isEqualTo: widget.user!.uid)
      .where("receiver_id", isEqualTo: receiverId)
      .get();

  var querySnapshot2 = await FirebaseFirestore.instance
      .collection("Friends")
      .where("status", isEqualTo: "accepted")
      .where("request_id", isEqualTo: receiverId)
      .where("receiver_id", isEqualTo: widget.user!.uid)
      .get();

  return querySnapshot.docs.isNotEmpty || querySnapshot2.docs.isNotEmpty;
  }
  Future<void> AddFriends(String? status1, String? receiverId) async {
    querySnapshot = await FirebaseFirestore.instance
        .collection("Friends")
        .where("receiver_id", isEqualTo: widget.user!.uid)
        .where("request_id", isEqualTo: receiverId)
        .get();

    querySnapshot.docs.forEach((doc) {
      documnet_id = doc.id;
    });
    await FirebaseFirestore.instance
        .collection("Friends")
        .doc(documnet_id)
        .update({
      "status": status1,
    });
  }

  Future<void> DeleteFriends(String? status1, String? receiverId) async {
    querySnapshot = await FirebaseFirestore.instance
        .collection("Friends")
        .where("receiver_id", isEqualTo: widget.user!.uid)
        .where("request_id", isEqualTo: receiverId)
        .get();

    querySnapshot.docs.forEach((doc) {
      documnet_id = doc.id;
    });
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Friends").doc(documnet_id);
    await documentReference.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => Dashboard(user: widget.user)),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.home)),
        // centerTitle: true,
        title: Text('Hi, $logged_username'),
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        elevation: 20,
      ),
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      body: Wrap(
        children :[ 
          StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No users found'),
              );
            }
        
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic> userData =
                    document.data() as Map<String, dynamic>;
        
                if (document.id == widget.user!.uid) {
                  return SizedBox();
                }
        
                return FutureBuilder<bool>(
                  future: FriendsAdd(userData["uid"]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
        
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
        
                    if (snapshot.data == true) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.network(userData["profilepic"]),
                              ),
                            ),
                          ),
                          title: Text(userData["name"]),
                          subtitle: Text(userData["email"]),
                          
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
            );
          },
        ),
          StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No users found'),
              );
            }
        
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic> userData =
                    document.data() as Map<String, dynamic>;
        
                if (document.id == widget.user!.uid) {
                  return SizedBox();
                }
        
                return FutureBuilder<bool>(
                  future: isFriendRequestAdded(userData["uid"]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
        
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
        
                    if (snapshot.data == true) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipOval(
                                child: Image.network(userData["profilepic"]),
                              ),
                            ),
                          ),
                          title: Text(userData["name"]),
                          subtitle: Text(userData["email"]),
                          trailing: Wrap(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  AddFriends("accepted", userData["uid"]);
                                },
                                child: Icon(Icons.check_circle),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  DeleteFriends("rejected", userData["uid"]);
                                },
                                child: Icon(Icons.cancel_rounded),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
            );
          },
        ),]
      ),
    );
  }
}
