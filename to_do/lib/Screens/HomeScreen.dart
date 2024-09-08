import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do/Screens/AddSCreen.dart';
import 'package:to_do/Screens/UpdateScreen.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List myData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODOS TODAY',
          style: TextStyle(color: Colors.white, letterSpacing: 3),
        ),
        backgroundColor: const Color(0xFF224460),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 43, 87, 123),
              Color.fromARGB(255, 27, 53, 75),
            ])),
        child: StreamBuilder(
          stream: _firestore.collection('TODO').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              myData = snapshot.data!.docs;
              return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  // Timestamp timestamp = myData[index]['Date'];
                  DateTime date = myData[index]['Date'].toDate();
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Card(
                      color: Color.fromARGB(255, 19, 46, 69),
                      child: ListTile(
                        title: Text(
                          '${myData[index]['Title']}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${myData[index]['Subtitle']}\n( ${date.toLocal().toString().split(' ')[0]} )',
                          style: const TextStyle(color: Colors.white60),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateScreen(docId: myData[index].id),
                                ));
                          },
                          child: const CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12,
                              )),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: SpinKitFadingFour(
                color: Colors.white,
                size: 60,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ));
        },
      ),
    );
  }
}
