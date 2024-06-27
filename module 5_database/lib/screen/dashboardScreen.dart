import 'package:assignment_sqflite_database/DatabaseFile/modelClass.dart';
import 'package:assignment_sqflite_database/DatabaseFile/service.dart';
import 'package:assignment_sqflite_database/screen/addTaskScreen.dart';
import 'package:assignment_sqflite_database/screen/editScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var date = DateTime.now();

  List<Task_Model> task_list = [];
  var taskservice = Taskservice();

  @override
  void initState() {
    super.initState();
    getRecordFromDB();
  }

  getRecordFromDB() async {
    var allTask = await taskservice.getservice();

    allTask.forEach((task) {
      var taskModel = Task_Model();
      taskModel.id = task["id"];
      taskModel.name = task["name"];
      taskModel.description = task["description"];
      taskModel.date = task["date"];
      taskModel.priority = task["priority"];

      setState(() {
        task_list.add(taskModel);
      });
    });
  }

  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${DateFormat('yMMMMEEEEd').format(date)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: task_list.isEmpty
                  ? Center(child: Text('No tasks available'))
                  : ListView.builder(
                      itemCount: task_list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            color: task_list[index].priority == "Low"
                                ? Colors.green
                                : task_list[index].priority == "Average"
                                    ? Colors.blue
                                    : task_list[index].priority == "High"
                                        ? Colors.red
                                        : Colors.grey,
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(
                                "Title: ${task_list[index].name}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description: ${task_list[index].description}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "Date: ${task_list[index].date}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              trailing: Wrap(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditScreen(
                                                taskModel: task_list[index]),
                                          ));
                                    },
                                    child: Icon(
                                      Icons.done_all_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      var taskModel = Task_Model();
                                      var taskService = Taskservice();

                                      taskModel.id = task_list[index].id;

                                      var result = await taskService
                                          .deleteservice(task_list[index].id);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardScreen(),
                                          ));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Task Delete'),
                                        duration: Duration(seconds: 1),
                                      ));
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
