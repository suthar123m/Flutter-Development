import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAddFriends extends StatefulWidget {
  final User? user;

  MyAddFriends({required this.user});

  @override
  State<MyAddFriends> createState() => _MyAddFriendsScreenState();
}

class _MyAddFriendsScreenState extends State<MyAddFriends> {
  String? logged_username;

  @override
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
   var querySnapshot = await FirebaseFirestore.instance
      .collection("Friends")
      .where("status", whereIn: ["pending", "accepted"])
      .where("request_id", isEqualTo: widget.user!.uid)
      .where("receiver_id", isEqualTo: receiverId)
      .get();

  var querySnapshot2 = await FirebaseFirestore.instance
      .collection("Friends")
      .where("status", whereIn: ["pending", "accepted"])
      .where("request_id", isEqualTo: receiverId)
      .where("receiver_id", isEqualTo: widget.user!.uid)
      .get();

  return querySnapshot.docs.isNotEmpty || querySnapshot2.docs.isNotEmpty;
  }

  

  Future<void> addFriend(String? receiverId, String? recusername) async {
    await FirebaseFirestore.instance.collection("Friends").doc().set({
      "request_id": widget.user!.uid, // loggedin user uid
      "receiver_id": receiverId,
      "request_username": logged_username,
      "receiver_username": recusername,
      "status": "pending",
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 102, 85, 132),
      content: Text("Request Added"),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      body: StreamBuilder<QuerySnapshot>(
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
              
                if (snapshot.data != true) {
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
                      trailing: ElevatedButton(
                        onPressed: () {
                          addFriend(userData["uid"], userData["name"]);
                        },
                        child: Icon(Icons.person_add),
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
      ),
    );
  }
}
