import 'package:flutter/material.dart';

class PermissionDialog extends StatefulWidget {
  const PermissionDialog({super.key});

  @override
  State<PermissionDialog> createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionDialog> {
  var alert;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Permission Dialog'),
        ),
        body: alert = AlertDialog(
          title: Text('Alert'),
          content: Text('Permossion Allow'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        ));
  }
}
