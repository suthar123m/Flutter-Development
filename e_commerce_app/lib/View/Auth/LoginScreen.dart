import 'package:e_commerce_app/Utilis/widget/Default_TextField.dart';
import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/View/Auth/ForgotPasswordScreen.dart';
import 'package:e_commerce_app/View/Auth/SignUpScreen.dart';
import 'package:e_commerce_app/ViewModel/FirebaseLoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  FirebaseLoginController firebaseLoginController = Get.put(
    FirebaseLoginController(),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assets/images/AppLogo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: Text('  LOG IN', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),
                  DefaultTextfield(
                    controller: firebaseLoginController.emailController,
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    validationText: 'Please Enter Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  DefaultTextfield(
                    controller: firebaseLoginController.passwordController,
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    validationText: 'Please Enter Password',
                    inputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Forgotpasswordscreen());
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Forget Password !',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await firebaseLoginController.fetchLogin();
                      }
                    },
                    child: Obx(() {
                      return firebaseLoginController.isLoading.value
                          ? SpinKitCircle(color: Colors.deepOrange, size: 30)
                          : DefaultButton(buttonText: 'LOG IN');
                    }),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(indent: 20, endIndent: 5)),
                      Text('OR'),
                      Expanded(child: Divider(indent: 5, endIndent: 20)),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an Account ?  '),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Signupscreen());
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
