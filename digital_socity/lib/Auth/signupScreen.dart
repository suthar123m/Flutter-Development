import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_socity/customWidget/elevatedButton.dart';
import 'package:digital_socity/customWidget/textField.dart';
import 'package:digital_socity/customWidget/textfieldPW.dart';
import 'package:digital_socity/Auth/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passworrdController = TextEditingController();
  final _memberController = TextEditingController();
  final _phonenumberController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  Future<void> SignUp(String name, String phoneNumber, String email,
      String password, String member) async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      await _firestore.collection('Member').doc(user!.uid).set({
        'username': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'paasword': password,
        'Member': member,
      });

      Navigator.of(context).pop();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

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
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      const SizedBox(height: 70),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Text('SignUp',
                              style: TextStyle(
                                  fontSize: 60, color: Colors.black))),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                              'Register Society Member\'s detail here',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17))),
                      const SizedBox(height: 30),
                      MyTextField(
                          Controller: _usernameController,
                          hintText: 'Enter Username',
                          validatorText: 'Please Enter UserName'),
                      const SizedBox(height: 10),
                      MyTextField(
                          Controller: _phonenumberController,
                          hintText: 'Enter PhoneNumber',
                          validatorText: 'Please Enter PhoneNumber'),
                      const SizedBox(height: 10),
                      MyTextField(
                          Controller: _emailController,
                          hintText: 'Enter Email',
                          validatorText: 'Please Enter Valid Email0'),
                      const SizedBox(height: 10),
                      MyTextFieldPW(
                          Controller: _passworrdController,
                          hintText: "Enter Password",
                          validatorText: 'Please Enter Valid Password'),
                      const SizedBox(height: 20),
                      FlutterPwValidator(
                          uppercaseCharCount: 1,
                          specialCharCount: 1,
                          numericCharCount: 1,
                          width: 300,
                          height: 130,
                          minLength: 8,
                          onSuccess: () {},
                          controller: _passworrdController),
                      const SizedBox(height: 20),
                      MyTextField(
                          Controller: _memberController,
                          hintText: 'Enter Chairman and SocietyMember',
                          validatorText: 'Please Enter Detail'),
                      const SizedBox(height: 50),
                      _isLoading
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Colors.black,
                                size: 30,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                SignUp(
                                    _usernameController.text.toString(),
                                    _phonenumberController.text.toString(),
                                    _emailController.text.toString(),
                                    _passworrdController.text.toString(),
                                    _memberController.text.toString());
                              },
                              child: MyEleButton(
                                eleColor: Colors.blue,
                                eleText: 'REGISTER',
                                eleBorder: Colors.black,
                                fontColor: Colors.black,
                              ),
                            ),
                      const SizedBox(height: 35),
                      const Row(
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
                            'You already have an Account?  ',
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 100),
                    ])))));
  }
}
