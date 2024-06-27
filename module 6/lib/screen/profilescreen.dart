import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_class_project/customWidget/mycustombutton.dart";
import "package:firebase_class_project/customWidget/textfield.dart";
import "package:firebase_class_project/screen/dashboardscreen.dart";
import "package:flutter/material.dart";

class MyProfileScreen extends StatefulWidget {
  User? user;
  MyProfileScreen({required this.user});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  String? username;
  Future<void> getData() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      _usernameController.text = document["name"];
      _emailController.text = document["email"];
    });
    username = document["name"];
  }

  Future<void> updateProfile() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .update({"name": _usernameController.text.toString()});

    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(user: widget.user),
        ));
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => Dashboard(user: widget.user)),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.home)),
        // centerTitle: true,
        title: Text('Hi, $username'),
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        elevation: 20,
      ),
      backgroundColor: Color.fromARGB(255, 177, 162, 205),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 84, 10, 97),
              Color.fromARGB(255, 220, 210, 231),
              Color.fromARGB(255, 47, 9, 65),
            ])),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Container(
              height: 490,
              child: Card(
                color: Color.fromRGBO(156, 131, 168, 0.498),
                elevation: 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MyTextFieldWidget(_emailController, "Email",
                          readOnly: false),
                      MyTextFieldWidget(_usernameController, "Username"),
                      GestureDetector(
                          onTap: () {
                            updateProfile();
                          },
                          child: MyCustomButton("Update Profile")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
