import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login_page.dart';

class MySignupPage extends StatefulWidget {
  const MySignupPage({super.key});

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: 250,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              width: 250,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Username',
                  suffixIcon: Icon(Icons.short_text_outlined),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              width: 250,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              width: 250,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.password),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              width: 250,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: Icon(Icons.password)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 45,
                      width: 240,
                      child: Text(
                        'By signingup, You agree to your tearm of service and privacy polocy',
                        style: TextStyle(fontSize: 12),
                      )),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyLoginUipage(),
                            ));
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
