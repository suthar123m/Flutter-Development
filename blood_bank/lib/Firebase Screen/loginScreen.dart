import 'package:blood_bank/Firebase%20Screen/RegisterScreen.dart';
import 'package:blood_bank/Admin%20Screen/screen/mainScreen.dart';
import 'package:blood_bank/User%20Screen/screen/mainScreen.dart';
import 'package:blood_bank/costomWidget/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isloading = false;

  bool _isVisible = true;

  // * Login using Firebase Authentication

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> Login() async {
    setState(() {
      _isloading = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passwordController.text.toString());

      print('Login');

      // * Navigate Login Detail to Main Screen

      User? user = userCredential.user;

      DocumentSnapshot documentSnapshot =
          await _firestore.collection('USER').doc(user!.uid).get();

      String username = documentSnapshot['Username'];
      String member = documentSnapshot['Member'];
      String email = documentSnapshot['Email'];
      String contact = documentSnapshot['Contact'];

      print("Username ================>>>>>>>>>>> $username");
      print('Member ================>>>>>>>>>>>>>>  $member');
      print('Member ================>>>>>>>>>>>>>>  $email');
      print('Member ================>>>>>>>>>>>>>>  $contact');

      if (member == 'Admin' || member == 'admin') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyMainScreen(
                membar: member,
                username: username,
              ),
            ));
      } else if (member == 'User' || member == 'user') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserMainScreen(
                username: username,
                membar: member,
              ),
            ));
      }
      setState(() {
        _isloading = false;
      });
    } catch (e) {
      print('Error');
      setState(() {
        _isloading = false;
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
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/bloodBankLogo.png',
            scale: 1,
          ),
          const Text(
            'BLOOD BANK',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 4),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 30),
          _isloading
              ? const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.indigo,
                    size: 50,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Login();
                      _emailController.clear();
                      _passwordController.clear();
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
                          'SUBMIT',
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
              const Text('Don\'T have an Account?  '),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
