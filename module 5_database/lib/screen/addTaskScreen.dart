import 'package:assignment_sqflite_database/DatabaseFile/modelClass.dart';
import 'package:assignment_sqflite_database/DatabaseFile/service.dart';
import 'package:assignment_sqflite_database/screen/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _taskcontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String? priority;
  Duration? difference;
  void setpriority() {
    print("${_selectedDate.toLocal()}".split(' ')[0].runtimeType);
    setState(() {
      DateTime todayy = DateTime.now();
      difference = _selectedDate.difference(todayy);
    });
    if (difference!.inDays >= 10) {
      priority = "Low";
    } else if (difference!.inDays >= 5 && difference!.inDays <= 10) {
      priority = "Average";
    } else if (difference!.inDays >= 0 && difference!.inDays <= 5) {
      priority = "High";
    }
    print(priority);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Add Task',
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _taskcontroller,
              decoration: InputDecoration(
                  hintText: 'Enter Task',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptioncontroller,
              decoration: InputDecoration(
                  hintText: 'Enter Discription',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Icon(Icons.calendar_today)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  setpriority();
                  var taskModel = Task_Model();
                  var taskService = Taskservice();

                  taskModel.name = _taskcontroller.text.toString();
                  taskModel.description =
                      _descriptioncontroller.text.toString();
                  taskModel.date = "${_selectedDate.toLocal()}".split(' ')[0];
                  taskModel.priority = priority.toString();

                  var result = taskService.insertService(taskModel);
                  print(
                      'Result ===================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  $result');
                  setState(() {
                    _taskcontroller.clear();
                    _descriptioncontroller.clear();
                  });

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ));
                },
                child: Text('Submit'))
          ],
        ),
      )),
    );
  }
}
