import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/screen/accountscreen.dart';
import 'package:firebase_class_project/screen/addfriends.dart';
import 'package:firebase_class_project/screen/homescreen.dart';
import 'package:firebase_class_project/screen/postscreen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  User? user;
  Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController = PageController();
  String? Display = "";
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
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      appBar: AppBar(
        // centerTitle: true,
        title: Text('Hi, $username'),
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        elevation: 20,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          MyHomeScreen(),
          MyAddFriends(user: widget.user),
          MyPostScreen(user: widget.user),
          AccountScreen(
            user: widget.user,
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple.shade200,
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
        height: 65,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 35,
            color: Colors.blue,
          ),
          Icon(
            Icons.group_outlined,
            size: 35,
            color: Colors.blue,
          ),
          Icon(
            Icons.add_a_photo,
            size: 35,
            color: Colors.blue,
          ),
          Icon(
            Icons.person_4_outlined,
            size: 35,
            color: Colors.blue,
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(seconds: 1), curve: Curves.easeOut);
        },
      ),
    );
  }
}
