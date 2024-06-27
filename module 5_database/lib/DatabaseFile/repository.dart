import 'dart:async';
import 'package:assignment_sqflite_database/DatabaseFile/databaseConnection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get myDatabase async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  insertData(tablename, dataentry) async {
    //insert data in table
    var conn = await myDatabase;
    return await conn!.insert(tablename, dataentry);
  }

  getdata(tablename) async {
    //fetch all records
    var conn = await myDatabase;
    return await conn!.query(tablename);
  }

  getspecificdata(tablename, id) async {
    // to get specific data
    var conn = await myDatabase;
    return await conn!.query(tablename, where: "id=?", whereArgs: [id]);
  }

  updatedata(tablename, dataupdate) async {
    //to update data
    var conn = await myDatabase;
    return await conn!.update(tablename, dataupdate,
        where: "id=?", whereArgs: [dataupdate["id"]]);
  }

  deletedata(tablename, id) async {
    //delete data from table
    var conn = await myDatabase;
    return await conn!.delete(tablename, where: "id=?", whereArgs: [id]);
  }
}
