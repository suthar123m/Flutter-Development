import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MySMSURLLauncher extends StatefulWidget {
  const MySMSURLLauncher({super.key});

  @override
  State<MySMSURLLauncher> createState() => _MySMSURLLauncherState();
}

class _MySMSURLLauncherState extends State<MySMSURLLauncher> {
  TextEditingController _urlcontroller = TextEditingController();

  Future<void> myurlLauncher(String? url) async {
    Uri uri = Uri.parse(url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS URL Launcher'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _urlcontroller,
              decoration: InputDecoration(
                labelText: "enter url",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                myurlLauncher(_urlcontroller.text.toString());
              },
              child: Text("LAUNCH URL")),
        ],
      ),
    );
  }
}
