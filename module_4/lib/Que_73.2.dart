import 'package:flutter/material.dart';

class MySplashScreen_Home extends StatefulWidget {
  const MySplashScreen_Home({super.key});

  @override
  State<MySplashScreen_Home> createState() => _MySplashScreen_HomeState();
}

class _MySplashScreen_HomeState extends State<MySplashScreen_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.teal[200],
        body: Center(
      child: Container(
        height: 250,
        width: 250,
        child: Image.network(
            'https://png.pngtree.com/thumb_back/fh260/background/20230511/pngtree-nature-background-sunset-wallpaer-with-beautiful-flower-farms-image_2592160.jpg'),
      ),
    ));
  }
}
