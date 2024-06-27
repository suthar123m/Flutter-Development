import 'package:flutter/material.dart';
import 'package:module_4/Que_71.2.dart';
import 'package:module_4/Que_71.3.dart';
import 'package:module_4/Que_71.4.dart';

class Que_71_Drawer extends StatefulWidget {
  const Que_71_Drawer({super.key});

  @override
  State<Que_71_Drawer> createState() => _Que_71_DrawerState();
}

class _Que_71_DrawerState extends State<Que_71_Drawer> {
  Widget widgetname = MyGalleryscreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer'),
      ),
      body: widgetname,
      drawer: Drawer(
          child: Column(
        children: [
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Navigation Drawer',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.photo),
                  onTap: () {
                    setState(() {
                      widgetname = MyGalleryscreen();
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    'Audio',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.audio_file_rounded),
                  onTap: () {
                    setState(() {
                      widgetname = AudioPlayerWithURL();
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    'Video',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.video_call),
                  onTap: () {
                    setState(() {
                      widgetname = VideoPlayerWithURL();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
