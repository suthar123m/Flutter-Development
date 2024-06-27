import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  void navigateToResultScreen(BuildContext context) {
    int num1 = int.tryParse(n1.text) ?? 0;
    int num2 = int.tryParse(n2.text) ?? 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(num1: num1, num2: num2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: n1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 1'),
            ),
            TextField(
              controller: n2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Number 2'),
            ),
            ElevatedButton(
              onPressed: () => navigateToResultScreen(context),
              child: Text('Show Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int num1;
  final int num2;

  ResultScreen({required this.num1, required this.num2});

  List<int> generateNumberList() {
    List<int> numbers = [];

    for (int i = num1; i <= num2; i++) {
      numbers.add(i);
    }

    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    List<int> numberList = generateNumberList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range App - Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numbers between $num1 and $num2:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: numberList
                  .map((number) => Text(
                        '$number',
                        style: TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
