import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  bool _isLoding = false;

  bool _isVisible = true;
  File? GetImageFile;

  // * Get Image From FILE and CAMERA

  Future<void> getImage(ImageSource imageSource) async {
    final resultImage = await ImagePicker().pickImage(source: imageSource);
  

    if (resultImage != null) {
      final ImagePickedPath = File(resultImage.path);
      setState(() {
        GetImageFile = ImagePickedPath;
      });

      print('Image Get Succesfully');
      print('Image Path ===============>>>>>>>>>>>>>>>>>>>>  $GetImageFile');
    } else {
      print('Image Not Get.....');
    }
    Navigator.pop(context);
  }

  // * Firebase Authentication for Registration

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register(
      String username, String email, String password, String contact) async {
    setState(() {
      _isLoding = true;
    });
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await imageUpload();

      User? user = userCredential.user;
      await _firestore.collection('USER').doc(user!.uid).set({
        'Username': username,
        'Email': email,
        'Password': password,
        'Contact': contact,
        'Image': imageUrl ?? '',
      });

      setState(() {
        _isLoding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Account Create Succesfully'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      setState(() {
        _isLoding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  // * Image Uploaded in Firebase Storage
  String? imageUrl;

  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<void> imageUpload() async {
    try {
      Reference reff =
          _firebaseStorage.ref().child('images/${DateTime.now()}.png ');
      TaskSnapshot upifloadTask = await reff
          .putFile(GetImageFile!)
          .whenComplete(() => print('Get image and Uploaded'));
      print('Refference ===========>>>>>>>>>>>>>>.  $reff');

      if (upifloadTask.state == TaskState.success) {
        imageUrl = await reff.getDownloadURL();
        print('Image URL: $imageUrl');
        setState(() {});
      } else {
        print('=====================>>>>>>>>>>>>>>>>>>>>  Upload Fail');
      }

      print('Image URL ==============>>>>>>>>>>>>>>>>>>>>>>   $imageUrl');
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 25, letterSpacing: 2),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 130,
                  height: 130,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      getImage(ImageSource.camera);
                                    },
                                    child: const CircleAvatar(
                                        backgroundColor: Colors.black12,
                                        maxRadius: 65,
                                        child:
                                            Icon(Icons.add_a_photo_outlined)),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      getImage(ImageSource.gallery);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.black12,
                                        maxRadius: 65,
                                        child: Icon(Icons.filter)),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: ClipOval(
                        child: GetImageFile == null
                            ? Icon(Icons.person,
                                size: 70, color: Colors.black54)
                            : Image(
                                image: FileImage(GetImageFile!),
                                fit: BoxFit.cover),
                      )),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Profile Picture',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: 'Enter Username',
                      hintStyle:
                          const TextStyle(fontSize: 15, color: Colors.black45),
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: 'Enter Email',
                      hintStyle:
                          const TextStyle(fontSize: 15, color: Colors.black45),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: 'Enter Contact',
                      hintStyle:
                          const TextStyle(fontSize: 15, color: Colors.black45),
                      labelText: 'Contact',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  obscureText: _isVisible,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: Icon(_isVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintStyle:
                          const TextStyle(fontSize: 15, color: Colors.black45),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 30),
// * Register Button
                _isLoding
                    ? SpinKitCircle(
                        color: Colors.blue[800],
                        size: 50,
                      )
                    : GestureDetector(
                        onTap: () {
                          register(
                              _usernameController.text.toString(),
                              _emailController.text.toString(),
                              _passwordController.text.toString(),
                              _contactController.text.toString());
                          _emailController.clear();
                          _usernameController.clear();
                          _passwordController.clear();
                          _contactController.clear();
                        },
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade200,
                              Colors.purple.shade200
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(
                            'REGISTER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 3,
                            ),
                          )),
                        ),
                      ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        endIndent: 10,
                        indent: 10,
                      )),
                      Text(
                        'OR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        indent: 10,
                        endIndent: 10,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an Account?  '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
