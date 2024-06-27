import 'package:flutter/material.dart';

class MyFontSizeChange extends StatefulWidget {
  const MyFontSizeChange({super.key});

  @override
  State<MyFontSizeChange> createState() => _MyFontSizeChangeState();
}

class _MyFontSizeChangeState extends State<MyFontSizeChange> {
  var _lattersized = 16.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Change'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 120,
              child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _lattersized += 2.0;
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Size Increse')),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 120,
              child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _lattersized -= 2.0;
                    });
                  },
                  icon: Icon(Icons.remove),
                  label: Text('Size Decrese')),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12),
              child: Center(
                child: Text(
                  'FONT',
                  style: TextStyle(fontSize: _lattersized),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
