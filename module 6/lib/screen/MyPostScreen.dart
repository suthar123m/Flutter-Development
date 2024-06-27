import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/screen/dashboardscreen.dart';
import 'package:firebase_class_project/screen/postscreen.dart';
import 'package:flutter/material.dart';

class MyAllPostScreen extends StatefulWidget {
  User? user;
  MyAllPostScreen({required this.user});

  @override
  State<MyAllPostScreen> createState() => _MyAllPostScreenState();
}

class _MyAllPostScreenState extends State<MyAllPostScreen> {
  String? username;

  Future<void> getData() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      username = document["name"];
    });
  }


  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                 Dashboard(user: widget.user)), (Route<dynamic> route) => false);
              }, icon: Icon(Icons.home)),
        // centerTitle: true,
        title: Text('Hi, $username'),
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        elevation: 20,
        
              
        
      ),
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("MyPost").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                // Fetch user's profile picture based on UID
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(data['uid'])
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                    if (userSnapshot.connectionState == ConnectionState.done) {
                      if (userSnapshot.hasData && userSnapshot.data != null) {
                        Map<String, dynamic> userData =
                            userSnapshot.data!.data() as Map<String, dynamic>;
                        // Check if profilePic and username are not null
                        String profilePic = userData["profilepic"] ?? "";
                        String username = userData["name"] ?? "";
                        if (userData['uid'] == widget.user!.uid) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                        profilePic),
                                                  ),
                                                ),
                                              ),
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  username,
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              trailing: PopupMenuButton<String>(
                                                onSelected: (String choice) {
                                                  if (choice == 'Edit') {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyPostScreen(
                                                            user: widget.user,
                                                            document1:
                                                                document.id,
                                                          ),
                                                        ));
                                                  } else if (choice ==
                                                      'Delete') {
                                                    FirebaseFirestore.instance
                                                        .collection("$username")
                                                        .doc(document.id)
                                                        .delete();
                                                  }
                                                },
                                                itemBuilder:
                                                    (BuildContext context) {
                                                  return [
                                                    PopupMenuItem<String>(
                                                      value: 'Edit',
                                                      child: Text('Edit'),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'Delete',
                                                      child: Text('Delete'),
                                                    ),
                                                  ];
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Rest of your code for displaying post details
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: 300,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                            data["postpic"],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${data["caption"]}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Handle case when user data is not available
                          return SizedBox.shrink(); // or any placeholder widget
                        }
                      } else {
                        // Handle case when user data is not available
                        return SizedBox.shrink(); // or any placeholder widget
                      }
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
