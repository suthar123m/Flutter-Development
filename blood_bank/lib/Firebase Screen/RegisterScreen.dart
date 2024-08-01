import 'package:blood_bank/Firebase%20Screen/loginScreen.dart';
import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameContrroller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _memberController = TextEditingController();

  bool _isloading = false;

  bool _isVisible = true;

  // * Firebase Authentication and Firebase Firestore

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> Register(
    String username,
    String email,
    String password,
    String contact,
    String member,
  ) async {
    setState(() {
      _isloading = true;
    });
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      await _firestore.collection('USER').doc(user!.uid).set({
        'Username': username,
        'Email': email,
        'Password': password,
        'Contact': contact,
        'Member': member,
      });
      print('Created');

      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Account Create Succesfully'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      setState(() {
        _isloading = false;
      });
      print('Error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Register',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MyTextField(
              hintTaxt: 'Enter Username',
              LableText: 'Username',
              controller: _usernameContrroller),
          MyTextField(
              hintTaxt: 'Enter Email',
              LableText: 'Email',
              controller: _emailController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: _passwordController,
              obscureText: _isVisible,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(_isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Password';
                }
              },
            ),
          ),
          MyTextField(
              hintTaxt: 'Enter Contact',
              LableText: 'Contact',
              controller: _contactController),
          MyTextField(
              hintTaxt: 'Enter Member User or Admin',
              LableText: 'Member',
              controller: _memberController),
          const SizedBox(height: 30),
          _isloading
              ? Center(
                  child: SpinKitFadingCircle(
                    color: Colors.indigo,
                    size: 50,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Register(
                          _usernameContrroller.text.toString(),
                          _emailController.text.toString(),
                          _passwordController.text.toString(),
                          _contactController.text.toString(),
                          _memberController.text.toString());
                    },
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade500,
                            Colors.lightBlue.shade200
                          ]),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: const Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Expanded(
                  child: Divider(
                indent: 20,
                endIndent: 5,
              )),
              Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Divider(
                indent: 5,
                endIndent: 20,
              )),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an Account?  '),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ))),
    );
  }
}
