import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_class_project/customWidget/colorfiles.dart';
import 'package:firebase_class_project/customWidget/mycustombutton.dart';
import 'package:firebase_class_project/customWidget/textfield.dart';
import 'package:firebase_class_project/screen/registerscreen.dart';
import 'package:flutter/material.dart';


class MyForgotPasswordScreen extends StatefulWidget {
  const MyForgotPasswordScreen({super.key});

  @override
  State<MyForgotPasswordScreen> createState() => _MyForgotPasswordScreenState();
}

class _MyForgotPasswordScreenState extends State<MyForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  Future<void> sendForgotLink() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.toString());

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        "Please check your email inbox for reset password link",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 3),
    ));
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
                        "Forgot Password",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextFieldWidget(_emailController, "Email"),
                    GestureDetector(
                        onTap: () {
                          sendForgotLink();
                        },
                        child: MyCustomButton("SEND MAIL")),
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
                    Text(
                      "Click Here for Login ?",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 205, 193, 227),
                          fontSize: 16),
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
