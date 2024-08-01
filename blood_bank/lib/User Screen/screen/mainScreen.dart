import 'package:blood_bank/Admin%20Screen/screen/AllUserScreen.dart';
import 'package:blood_bank/User%20Screen/screen/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserMainScreen extends StatefulWidget {
  UserMainScreen({
    super.key,
    required this.username,
    required this.membar,
  });
  String username;
  String membar;

  @override
  State<UserMainScreen> createState() => UserMainScreenState();
}

class UserMainScreenState extends State<UserMainScreen> {
  // * Firebase Authentication Logout

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Logout() async {
    await _auth.signOut();
    print('Logout');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.indigo[900],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, ${widget.username} ( ${widget.membar} )',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              Logout();
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://media.istockphoto.com/id/637957146/photo/blood-type-touch-screen-concept.jpg?s=612x612&w=0&k=20&c=eqW9JzYLzv-rsqHgMgnPapyv2P7i0lS1Vs48AkdMGsw=',
                    fit: BoxFit.fill,
                  ),
                ),
                const TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.indigo,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Home',
                      ),
                      Tab(
                        text: 'All User',
                      ),
                    ]),
                Container(
                    height: 500,
                    child: const TabBarView(
                        children: [UserHomeScreen(), AllUserScreen()]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
