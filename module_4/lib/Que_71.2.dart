import 'package:flutter/material.dart';

class MyGalleryscreen extends StatefulWidget {
  const MyGalleryscreen({super.key});

  @override
  State<MyGalleryscreen> createState() => _MyGalleryscreenState();
}

class _MyGalleryscreenState extends State<MyGalleryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
              child: Container(
        height: 250,
        width: 250,
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbsoO355bNEEiG8FkFj0uvCxRCrAqxw92JjQ&usqp=CAU'),
      ))),
    );
  }
}
