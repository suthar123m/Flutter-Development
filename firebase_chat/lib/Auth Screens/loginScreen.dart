import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/Auth%20Screens/registerScreen.dart';
import 'package:firebase_chat/Screens/dashboardScreen.dart';
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

  bool _isLoding = false;

// * Firebase Authentication with LOGIN

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoding = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

// * Navigate Username To Dashboard Screen

      User? user = userCredential.user;

      DocumentSnapshot userData =
          await _firestore.collection('USER').doc(user!.uid).get();

      String _username = userData['Username'];
      String _email = userData['Email'];
      String _contact = userData['Contact'];
      String _image = userData['Image'];

      print('====================>>>>>>>>>>>>>>>>>>>>  $_username');

      setState(() {
        _isLoding = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              contact: _contact,
              email: _email,
              username: _username,
              imageUrl: _image,
            ),
          ));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Succesfully'),
        duration: Duration(seconds: 1),
      ));
    } catch (e) {
      setState(() {
        _isLoding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'), duration: Duration(seconds: 1)));
    }
  }

  bool _isVisible = true;
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
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'FIREBASE CHAT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4),
                  ),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25, letterSpacing: 2),
                  ),
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
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Forgot Password ?',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

// ? Login Button
                _isLoding
                    ? SpinKitCircle(
                        color: Colors.blue[900],
                        size: 50,
                      )
                    : GestureDetector(
                        onTap: () {
                          login(_emailController.text.toString(),
                              _passwordController.text.toString());
                          _emailController.clear();
                          _passwordController.clear();
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
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 5,
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
                      const Text('Don\'t hane an Account?  '),
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
