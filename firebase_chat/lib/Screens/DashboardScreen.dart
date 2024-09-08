import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/Screens/ChatScreen.dart';
import 'package:firebase_chat/Screens/FriendScreen.dart';
import 'package:firebase_chat/Screens/ResuestScreen.dart';
import 'package:firebase_chat/Service/NotificationService.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({
    super.key,
    required this.username,
    required this.email,
    required this.contact,
    required this.imageUrl,
  });

  String username;
  String email;
  String contact;
  String imageUrl;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _statusController = TextEditingController();

// * Notification'

  NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notificationService.requrestNotificationPermission();
    _notificationService.isTokenRefresh();

    _notificationService.getDeviceToken().then((value) {
      print('Device Token  ========>>>>>>>>>>>>>  $value');
    });
  }

// * Logout

  Future<void> logout() async {
    await _auth.signOut();
    Navigator.pop(context);
  }

// * Profile's Status

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
// * Drawer

          drawer: Drawer(
            child: Column(
              children: [
                const SizedBox(height: 35),
                SizedBox(
                  height: 420,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      // * image in String form
                      Stack(
                        children: [
                          SizedBox(
                              height: 180,
                              width: 180,
                              child: ClipOval(
                                child: Image.network('${widget.imageUrl}'),
                              )),
                          Positioned(
                              top: 140,
                              right: 1,
                              child: CircleAvatar(
                                backgroundColor: Colors.black12,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    )),
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('Profile Image'),
                      const SizedBox(height: 10),
                      ListTile(
                        title: Text(
                          '${widget.username}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                        subtitle: Column(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  '${widget.email}',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text('${widget.contact}'),
                            )
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Update Detail'),
                                    content: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Username..'),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Contact..'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('Update')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancle')),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.mode_edit_outlined,
                              color: Colors.black45,
                            )),
                      ),

                      ListTile(
                        title: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'I am a Flutter Developer, Work in Tops Technologies'),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Update Status'),
                                    content: TextField(
                                      controller: _statusController,
                                      decoration:
                                          InputDecoration(hintText: 'Status..'),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            _statusController.clear();
                                            Navigator.pop(context);
                                          },
                                          child: Text('Update')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancle')),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.mode_edit_outlined,
                              color: Colors.black45,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    logout();
                    Navigator.of(context).pop();
                  },
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(letterSpacing: 2),
                  ),
                )
              ],
            ),
          ),
// * AppBar

          appBar: AppBar(
            // backgroundColor: Colors.deepPurple[400],
            title: Text('Hi, ${widget.username}'),
            elevation: 5,

            bottom: const TabBar(
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 3),
              unselectedLabelStyle: TextStyle(
                  fontSize: 13, color: Colors.black, letterSpacing: 0),
              indicatorColor: Colors.black,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('REQUEST'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('CHATS'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('FRIENDS'),
                ),
              ],
            ),
            toolbarHeight: 50,
          ),
// * Body

          body: const TabBarView(children: [
            RequestScreen(),
            ChatsScreen(),
            FriendScreen(),
          ]),
        ));
  }
}
