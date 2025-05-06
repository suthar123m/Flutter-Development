import 'package:e_commerce_app/Utilis/Constant/Constants.dart';
import 'package:e_commerce_app/View/Intro%20Screen/IntroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E Commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: AppBarTheme(
          color: whiteColor,
          elevation: 1,
          iconTheme: IconThemeData(color: blackColor),
        ),
      ),
      home: Introscreen(),
    );
  }
}
