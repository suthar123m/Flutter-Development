import 'package:database_curd/DB%20file/modelClass.dart';
import 'package:database_curd/DB%20file/service.dart';
import 'package:database_curd/screen/dashboardScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: 64,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  'DATABASE CRUD',
                  style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(height: 25),
              TextField(
                keyboardType: TextInputType.name,
                controller: _nameController,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _ageController,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                    hintText: 'Enter Age',
                    labelText: 'Age',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _contactController,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    hintText: 'Enter Contact',
                    labelText: 'Contact',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  var _model = SetDatabaseClass();
                  var _service = DatabaseService();

                  // here we create object of the Class , name is _model

                  _model.name = _nameController.text.toString();
                  _model.email = _emailController.text.toString();
                  _model.age = _ageController.text.toString();
                  _model.contact = _contactController.text.toString();

                  var result =
                      await _service.insertService('DatabaseUser', _model);

                  print('RESULT ===========>>>>>>>>>>>>>>>>>>>>>>>   $result');

                  _nameController.clear();
                  _emailController.clear();
                  _ageController.clear();
                  _contactController.clear();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ));
                },
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.purple])),
                  child: Center(
                      child: Text(
                    'SUBMIT',
                    style: TextStyle(
                        letterSpacing: 4,
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ));
                },
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.purple])),
                  child: Center(
                      child: Text(
                    'VIEW RECORDS',
                    style: TextStyle(
                        letterSpacing: 4,
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
