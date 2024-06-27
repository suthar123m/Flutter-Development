import 'package:flutter/material.dart';
import 'reset_password.dart';
import 'forget_password.dart';

class MyEmailVerification extends StatefulWidget {
  const MyEmailVerification({super.key});

  @override
  State<MyEmailVerification> createState() => _MyEmailVerificationState();
}

class _MyEmailVerificationState extends State<MyEmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Verification',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Myforgetpassword(),
                ));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 4, 4, 4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 200,
            child: Text(
              'Get Your Code',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            child: Center(
              child: Text(
                  'Please Enter yout fout degit Code that send to your email address'),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 50,
            width: 70,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'OTP',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              width: 250,
              child: Row(children: [
                Container(
                  child: Text('if you dose not recive code! '),
                ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        // press for resend
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                )
              ])),
          SizedBox(
            height: 30,
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Myresetpassword(),
                      ));
                },
                child: Text('Verify and Proceed')),
          )
        ],
      ),
    );
  }
}
