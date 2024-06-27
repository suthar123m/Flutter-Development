import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/customWidget/colorfiles.dart';
import 'package:firebase_class_project/customWidget/mycustombutton.dart';
import 'package:firebase_class_project/customWidget/textfield.dart';
import 'package:firebase_class_project/screen/dashboardscreen.dart';
import 'package:firebase_class_project/screen/forgotpassword_screen.dart';
import 'package:firebase_class_project/screen/registerscreen.dart';
import 'package:flutter/material.dart';

class MYLoginScreen extends StatefulWidget {
  const MYLoginScreen({super.key});

  @override
  State<MYLoginScreen> createState() => _MYLoginScreenState();
}

class _MYLoginScreenState extends State<MYLoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.toString(),
              password: _passwordController.text.toString());

      User? user = userCredential.user;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(
              user: user,
            ),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          "Error : Invalid Email or password",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 3),
      ));
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
                        "SIGN IN",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextFieldWidget(_emailController, "Email"),
                    MyTextFieldWidget(_passwordController, "Password"),
                    GestureDetector(
                        onTap: () {
                          login();
                        },
                        child: MyCustomButton("LOG IN")),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyRegistrationScreen(),
                                ));
                          },
                          child: Text(
                            "New User | Register Here",
                            style: TextStyle(
                                color: DISPLAY_TEXT_COLOR,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyForgotPasswordScreen()));
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 205, 193, 227),
                            fontSize: 16),
                      ),
                    )
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
