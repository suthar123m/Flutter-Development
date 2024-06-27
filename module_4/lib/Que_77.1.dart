import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCallURLlauncher extends StatefulWidget {
  const MyCallURLlauncher({super.key});

  @override
  State<MyCallURLlauncher> createState() => _MyCallURLlauncherState();
}

class _MyCallURLlauncherState extends State<MyCallURLlauncher> {
  List personlist = ['Mahendra', 'Ravi'];
  List contectlist = [1234335346, 45645757457];

  Future<void> callApp(String? number) async {
    print(number);
    Uri phonecall = Uri(scheme: "tel", path: number);
    await launchUrl(phonecall);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Call URL Launcher'),
      ),
      body: ListView.builder(
        itemCount: personlist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              callApp(contectlist[index]);
            },
            child: Card(
              elevation: 20,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("${personlist[index]}"),
                subtitle: Text("${contectlist[index]}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
