import 'package:database_curd/DB%20file/modelClass.dart';
import 'package:database_curd/DB%20file/service.dart';
import 'package:database_curd/screen/updateUserScreen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<SetDatabaseClass> MyData = [];

  var _model = SetDatabaseClass();
  var _service = DatabaseService();

  void getRecords() async {
    _service = DatabaseService();

    // get data from readService to getData variable
    var getData = await _service.readService('DatabaseUser');

    print(
        'GET ALL  DATA ===================>>>>>>>>>>>>>>>>>>>>>>>>    $getData');

    getData.forEach((singleData) {
      setState(() {
        _model = SetDatabaseClass();
        _model.id = singleData['id'];
        _model.name = singleData['name'];
        _model.email = singleData['email'];
        _model.age = singleData['age'];
        _model.contact = singleData['contact'];
        MyData.add(_model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 64,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                  child: Text(
                'VIEW RECORDS',
                style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: MyData.isEmpty
                  ? const Center(
                      child: Text(
                        'NO DATA AVAILABLE',
                        style: TextStyle(
                            letterSpacing: 6,
                            fontSize: 15,
                            color: Colors.black38),
                      ),
                    )
                  : ListView.builder(
                      itemCount: MyData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Slidable(
                            key: ValueKey(index),
                            startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    foregroundColor: Colors.red,
                                    icon: Icons.delete,
                                    onPressed: (context) async {
                                      var _model = SetDatabaseClass();
                                      var _service = DatabaseService();
                                      _model.id = MyData[index].id;
                                      var result = await _service.deleteService(
                                          'DatabaseUser', _model);
                                      print(
                                          'DELETE RECORDS ================>>>>>>>>>>>>>>>>>>>>> $result');

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DashboardScreen()));
                                    },
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateUserScreen(
                                                    modelClass: _model),
                                          ));
                                    },
                                    foregroundColor: Colors.black,
                                    icon: Icons.edit,
                                  )
                                ]),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Colors.blue.shade100,
                                    Colors.purple.shade100
                                  ])),
                              child: ListTile(
                                  title: Text(
                                    'NAME : ${MyData[index].name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      'EMAIL : ${MyData[index].email}\nCONTACT : ${MyData[index].contact}'),
                                  trailing: CircleAvatar(
                                    backgroundColor: Colors.purple.shade300,
                                    child: Text('${MyData[index].age}'),
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    ));
  }
}
