import 'package:database_curd/DB%20file/modelClass.dart';
import 'package:database_curd/DB%20file/service.dart';
import 'package:database_curd/screen/adduserScreen.dart';
import 'package:flutter/material.dart';

class UpdateUserScreen extends StatefulWidget {
  UpdateUserScreen({
    super.key,
    required this.modelClass,
  });
  var modelClass = SetDatabaseClass();

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  void getRecords() {
    _nameController.text = widget.modelClass.name!;
    _emailController.text = widget.modelClass.email!;
    _ageController.text = widget.modelClass.age.toString();
    _contactController.text = widget.modelClass.contact.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecords();
  }

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
                  'UPDATE CRUD',
                  style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Enter Age',
                    labelText: 'Age',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Enter Contact',
                    labelText: 'Contact',
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  var _model = SetDatabaseClass();
                  var _service = DatabaseService();

                  _model.id = widget.modelClass.id;
                  _model.name = _nameController.text.toString();
                  _model.email = _emailController.text.toString();
                  _model.age = _ageController.text.toString();
                  _model.contact = _contactController.text.toString();

                  var result =
                      await _service.updateService('DatabaseUser', _model);

                  print('UPDATE RESULT =========>>>>>>>>>>>>  $result ');

                  setState(() {
                    _nameController.clear();
                    _emailController.clear();
                    _ageController.clear();
                    _contactController.clear();
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUserScreen(),
                      ));
                },
                child: Container(
                  height: 68,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.purple])),
                  child: Center(
                      child: Text(
                    'UPDATE',
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
