import 'package:assignment_sqflite_database/DatabaseFile/modelClass.dart';
import 'package:assignment_sqflite_database/DatabaseFile/service.dart';
import 'package:assignment_sqflite_database/screen/dashboardScreen.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  EditScreen({
    super.key,
    required this.taskModel,
  });
  var taskModel = Task_Model();

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Task : ${widget.taskModel.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Description : ${widget.taskModel.description}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Date : ${widget.taskModel.date}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    var taskModel = Task_Model();
                    var taskservice = Taskservice();

                    taskModel.id = widget.taskModel.id;
                    taskModel.name = widget.taskModel.name;
                    taskModel.description = widget.taskModel.description;
                    taskModel.date = widget.taskModel.date;
                    taskModel.priority = 'Complete';

                    var result = await taskservice.updateservice(taskModel);

                    print(result);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Task Compelete'),
                      duration: Duration(seconds: 1),
                    ));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ));
                  },
                  child: Text('Compelete')),
            )
          ],
        ),
      )),
    );
  }
}
