import 'package:e_commerce_app/Utilis/Constant/Constants.dart';
import 'package:e_commerce_app/Utilis/widget/Default_TextField.dart';
import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/ViewModel/DropDownController.dart';
import 'package:e_commerce_app/ViewModel/FirebaseAuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  FirebaseAuthController firebaseAuthController = Get.put(
    FirebaseAuthController(),
  );

  DropdownController dropdownController = Get.put(DropdownController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Sign in with your Email and Password',
                    style: TextStyle(fontSize: 13, color: blackColor40),
                  ),
                  Text(
                    'or Continue with your Social Media',
                    style: TextStyle(fontSize: 13, color: blackColor40),
                  ),
                  SizedBox(height: 30),
                  DefaultTextfield(
                    controller: firebaseAuthController.usernameController,
                    hintText: 'Enter UserName',
                    labelText: 'UserName',
                    validationText: 'Please Enter UserName',
                    inputType: TextInputType.text,
                  ),
                  DefaultTextfield(
                    controller: firebaseAuthController.emailController,
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    validationText: 'Please Enter Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  DefaultTextfield(
                    controller: firebaseAuthController.passwordController,
                    hintText: 'Enter PassWord',
                    labelText: 'PassWord',
                    validationText: 'Please Enter PassWord',
                    inputType: TextInputType.visiblePassword,
                  ),
                  DefaultTextfield(
                    controller: firebaseAuthController.contactController,
                    hintText: 'Enter Contact',
                    labelText: 'Contact',
                    validationText: 'Please Enter Contact',
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 65,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Obx(
                      () => DropdownButton<String>(
                        value: dropdownController.selectedValue.value,
                        // icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,

                        underline: SizedBox(),
                        onChanged: (String? newValue) {
                          dropdownController.changeValue(newValue!);
                        },
                        items:
                            dropdownController.items
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                })
                                .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuthController.fetchFirebaseAuthdata(
                          dropdownController.selectedValue.toString(),
                        );
                      }
                    },
                    child: Obx(() {
                      return firebaseAuthController.isLoading.value
                          ? SpinKitCircle(color: Colors.deepOrange, size: 30)
                          : DefaultButton(buttonText: 'SIGN IN');
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already have Account ?  '),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'LOG IN',
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
