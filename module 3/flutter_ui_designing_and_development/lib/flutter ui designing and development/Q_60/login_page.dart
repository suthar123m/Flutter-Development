import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'forget_password.dart';
import 'main_screen.dart';

class MyLoginUipage extends StatefulWidget {
  const MyLoginUipage({super.key});

  @override
  State<MyLoginUipage> createState() => _MyLoginUipageState();
}

class _MyLoginUipageState extends State<MyLoginUipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMainScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Column(children: [
          Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 4, 4, 4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                  child: Text(
                'Login Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ))),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 70,
              width: 250,
              child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      prefixIconColor: Colors.black,
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                            style: BorderStyle.solid),
                      )))),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 70,
              width: 250,
              child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password_sharp),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )))),
          SizedBox(
            height: 60,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                // press hear for next login page
              },
              child: Text('Login'),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              width: 270,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text(
                      'Do not have an Account? ',
                      style: TextStyle(fontSize: 15),
                    )),
                    Container(
                        child: TextButton(
                            onPressed: () {
                              // press hear for Sign up Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MySignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )))
                  ])),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 40,
              width: 200,
              child: TextButton(
                onPressed: () {
                  // press hear for change your password
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myforgetpassword()),
                  );
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ]));
  }
}
