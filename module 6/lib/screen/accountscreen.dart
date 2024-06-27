import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/screen/MyPostScreen.dart';
import 'package:firebase_class_project/screen/loginscreen.dart';
import 'package:firebase_class_project/screen/myfriends.dart';
import 'package:firebase_class_project/screen/profilescreen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  User? user;
  AccountScreen({required this.user});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfileScreen(user: widget.user),
                  ));
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Post'),
            leading: Icon(Icons.chat),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAllPostScreen(user: widget.user),
                  ));
              // Navigate to chat settings screen
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings screen
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Friends'),
            leading: Icon(Icons.lock),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFRIENDS(user: widget.user),
                  ));
              // Navigate to privacy settings screen
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Help'),
            leading: Icon(Icons.help),
            onTap: () {
              // Navigate to help screen
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Invite a friend'),
            leading: Icon(Icons.person_add),
            onTap: () {
              // Invite a friend functionality
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Logout functionality
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MYLoginScreen(),
                  ));
            },
            trailing: Icon(Icons.navigate_next_sharp),
          ),
        ],
      ),
    );
  }
}
