import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/View/Auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 70),
                    Text(
                      'BuyKart',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 5,
                      ),
                    ),
                    Image.asset(
                      'assets/images/intro_2.png',
                      height: size.height * 0.5,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to BuyKart, Let\'s Shop!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black26),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Loginscreen());
                  },
                  child: DefaultButton(buttonText: 'Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
