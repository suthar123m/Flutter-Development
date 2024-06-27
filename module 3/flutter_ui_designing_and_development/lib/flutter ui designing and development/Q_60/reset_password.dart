import 'package:flutter/material.dart';
import 'login_page.dart';
import 'forget_password.dart';

class Myresetpassword extends StatefulWidget {
  const Myresetpassword({super.key});

  @override
  State<Myresetpassword> createState() => _MyresetpasswordState();
}

class _MyresetpasswordState extends State<Myresetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
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
      body: Column(children: [
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
          width: double.maxFinite,
          child: Center(
            child: Text(
              'Enter New Password',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 250,
          child: Center(
            child: Text(
                'Your New Password must be different from previously used password'),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Container(
          height: 50,
          width: 250,
          child: TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                labelText: ' New Password', suffixIcon: Icon(Icons.password)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 50,
            width: 250,
            child: TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  labelText: ' Confirm Password',
                  suffixIcon: Icon(Icons.password)),
            )),
        SizedBox(
          height: 30,
        ),
        Container(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyLoginUipage(),
                    ));
              },
              child: Text('Continue')),
        )
      ]),
    );
  }
}
