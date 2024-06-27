import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: ClipOval(
                                                child: Image.network(profilePic),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              username,
                                              style: TextStyle(
                                                  fontSize: 26,
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.bold),
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
