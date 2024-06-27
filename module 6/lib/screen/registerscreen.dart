import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/customWidget/colorfiles.dart';
import 'package:firebase_class_project/customWidget/mycustombutton.dart';
import 'package:firebase_class_project/customWidget/textfield.dart';
import 'package:firebase_class_project/screen/loginscreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyRegistrationScreen extends StatefulWidget {
  const MyRegistrationScreen({super.key});

  @override
  State<MyRegistrationScreen> createState() => _MyRegistrationScreenState();
}

class _MyRegistrationScreenState extends State<MyRegistrationScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ImagePicker _picker = ImagePicker();
  var d_imageURL =
      "https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small_2x/default-avatar-profile-icon-of-social-media-user-vector.jpg";
  //var document;
  File? _pic;
  bool _imageSelected = false;
  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passwordController.text.toString());

    User? user = userCredential.user;
    if (_pic != null) {
      final _storage = await FirebaseStorage.instance;
      final _ref =
          _storage.ref().child("users").child(DateTime.now().toString());
      final uploadImage = _ref.putFile(_pic!);
      final snapshot = await uploadImage.whenComplete(() => null);
      // var dowurl = await snapshot._ref.getDownloadURL();
      d_imageURL = await snapshot.ref.getDownloadURL();
    }
    await FirebaseFirestore.instance.collection("Users").doc(user!.uid).set({
      "uid": user.uid,
      "name": _usernameController.text.toString(),
      "email": _emailController.text.toString(),
      "profilepic": d_imageURL,
    });

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MYLoginScreen(),
        ));
  }

  void selectPic() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pic = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 550,
            child: Card(
              color: Color.fromRGBO(156, 131, 168, 0.498),
              elevation: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Create An Account",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: selectPic,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            _imageSelected ? FileImage(_pic!) : null,
                        child: !_imageSelected
                            ? Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey[600],
                              )
                            : null,
                      ),
                    ),
                    MyTextFieldWidget(_usernameController, "Username"),
                    MyTextFieldWidget(_emailController, "Email"),
                    MyTextFieldWidget(_passwordController, "Password"),
                    GestureDetector(
                        onTap: () {
                          registerUser();
                        },
                        child: MyCustomButton("SIGN UP")),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MYLoginScreen(),
                                ));
                          },
                          child: Text(
                            "Already User ? Click Here for Login",
                            style: TextStyle(
                                color: DISPLAY_TEXT_COLOR,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
