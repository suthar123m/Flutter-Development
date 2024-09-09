import 'package:digital_socity/Chairman/C_DashBoardScreen.dart';
import 'package:digital_socity/Society%20Member/S_dashboard.dart';
import 'package:digital_socity/customWidget/elevatedButton.dart';
import 'package:digital_socity/customWidget/textField.dart';
import 'package:digital_socity/customWidget/textfieldPW.dart';
import 'package:digital_socity/Auth/signupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passworrdController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  Future<void> Login(String email, String password) async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Firebase Authentication

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Get username from FirebaseFirestore Database

      User? user = userCredential.user;

      DocumentSnapshot member =
          await _firestore.collection('Member').doc(user!.uid).get();

      String username = member['username'];
      String Member = member['Member'];

      print('username : $username');
      print('society member : $member');

      // Navigate either Chairmen Dashboard Screen or societymemmber dashboard screen

      if (Member == 'SocietyMember' ||
          Member == 'Societymember' ||
          Member == 'societyMember' ||
          Member == 'societymember' ||
          Member == 'Society Member' ||
          Member == 'Society member' ||
          Member == 'society Member' ||
          Member == 'society member') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SocietyMemberDashboard(
                username: username,
              ),
            ));
        // ignore: unrelated_type_equality_checks
      } else if (Member == 'Chairman' ||
          Member == ' chairman' ||
          Member == 'Chairman' ||
          Member == ' chairman') {
        print('Login Succesfully :)');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChairmanDashBoard(username: username),
            ));
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            'Error',
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Log in',
                        style: TextStyle(
                          fontSize: 60,
                        ))),
                const SizedBox(height: 40),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                        'Welcome Back! Please login into\nYour Digital Society',
                        style: TextStyle(fontSize: 17))),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child:
                          const Text('Email', style: TextStyle(fontSize: 17))),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  Controller: _emailController,
                  hintText: 'Enter Email',
                  validatorText: 'Please Enter valid Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Password',
                          style: TextStyle(fontSize: 17))),
                ),
                const SizedBox(height: 10),
                MyTextFieldPW(
                    Controller: _passworrdController,
                    hintText: 'Enter Password',
                    validatorText: 'Please Enter valid Email'),
                const SizedBox(height: 20),
                FlutterPwValidator(
                    failureColor: Colors.red,
                    defaultColor: Colors.black,
                    uppercaseCharCount: 1,
                    specialCharCount: 1,
                    numericCharCount: 1,
                    width: 300,
                    height: 130,
                    minLength: 8,
                    onSuccess: () {},
                    controller: _passworrdController),
                const SizedBox(height: 40),
                _isLoading
                    ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Login(_emailController.text.toString(),
                              _passworrdController.text.toString());
                          _emailController.clear();
                          _passworrdController.clear();
                        },
                        child: MyEleButton(
                          eleColor: Colors.blue,
                          eleText: 'LOGIN',
                          eleBorder: Colors.black,
                          fontColor: Colors.black,
                        ),
                      ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 5,
                    )),
                    Text(
                      'OR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 5,
                      endIndent: 10,
                    )),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an Account?  ',
                      style: TextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
