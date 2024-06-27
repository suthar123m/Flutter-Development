/*  
Create an application with bottom navigation with 3 tabs Gallery,audio and video and design each page with dummy data 
*/

import 'package:flutter/material.dart';
import 'package:module_4/Que_70.2.dart';
import 'package:module_4/Que_70.3.dart';
import 'package:module_4/Que_70.4.dart';

class Que_70_NavigatorBar extends StatefulWidget {
  const Que_70_NavigatorBar({super.key});

  @override
  State<Que_70_NavigatorBar> createState() => _Que_70_NavigatorBarState();
}

class _Que_70_NavigatorBarState extends State<Que_70_NavigatorBar> {
  List<Widget> SelectList = [
    MyHomeScreen(), // call Gallery screen
    AudioScreenWithURL(), // call Audio screen
    VideoPlayerWithURL(), // call Video screen
  ];

  var CurrentIndex = 0;

  void tapClick(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigator Bar'),
      ),
      body: SelectList.elementAt(CurrentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Gallery',
              backgroundColor: Colors.black,
              tooltip: 'Gallery'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.audio_file,
                color: Colors.black,
              ),
              label: 'Audio',
              backgroundColor: Colors.black,
              tooltip: 'Audio'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_camera_back,
                color: Colors.black,
              ),
              label: 'Video',
              backgroundColor: Colors.black,
              tooltip: 'Video'),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        elevation: 5,
        onTap: tapClick,
        currentIndex: CurrentIndex,
      ),
    );
  }
}
