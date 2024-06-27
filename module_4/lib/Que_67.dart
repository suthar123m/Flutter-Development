import 'package:flutter/material.dart';

class Que_67_PopUp extends StatefulWidget {
  const Que_67_PopUp({super.key});

  @override
  State<Que_67_PopUp> createState() => _Que_67_PopUpState();
}

class _Que_67_PopUpState extends State<Que_67_PopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pop Up'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'Profile') {
                    print("PROFILE SCREEN CALLED");
                  } else if (value == 'Logout') {
                    print("Logout Screen Called");
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Profile'),
                      value: 'Profile',
                    ),
                    PopupMenuItem(
                      child: Text('Logout'),
                      value: 'Logout',
                    ),
                  ];
                },
              ),
            )
          ],
        ),
        body: Center(
          child: Text(
            'Tops Tecnology',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
// ok