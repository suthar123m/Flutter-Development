import 'package:e_commerce_app/ViewModel/FirebaseLogoutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Personscreen extends StatefulWidget {
  String username;
  String email;
  String role;
  String contact;

  Personscreen({
    required this.username,
    required this.email,
    required this.role,
    required this.contact,
  });

  @override
  State<Personscreen> createState() => _PersonscreenState();
}

class _PersonscreenState extends State<Personscreen> {
  FirebaseLogoutController firebaseLogoutController = Get.put(
    FirebaseLogoutController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    widget.username,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(widget.email, style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.call),
                  title: Text(widget.contact, style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.document_scanner),
                  title: Text(widget.role, style: TextStyle(fontSize: 20)),
                ),Divider(),
                SizedBox(height: 60),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(widget.role, style: TextStyle(fontSize: 20)),
                  trailing: IconButton(onPressed: () {
                    firebaseLogoutController.fetchFirebaseLogout();
                  }, icon: Icon(Icons.arrow_forward)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
