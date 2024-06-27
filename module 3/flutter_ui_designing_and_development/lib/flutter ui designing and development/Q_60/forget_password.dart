import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'login_page.dart';

class Myforgetpassword extends StatefulWidget {
  const Myforgetpassword({super.key});

  @override
  State<Myforgetpassword> createState() => _MyforgetpasswordState();
}

class _MyforgetpasswordState extends State<Myforgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyLoginUipage(),
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
            height: 80,
          ),
          Container(
            child: Text(
              'Mail Address Here',
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
            width: 225,
            child: Center(
              child: Text(
                'Enter the Email address Associated with your account',
                style: TextStyle(),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 50,
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.phone),
                labelText: 'Mobile Number',
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  // press hear for email verification
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyEmailVerification(),
                    ),
                  );
                },
                child: Text('Recover Password')),
          ),
        ],
      ),
    );
  }
}
