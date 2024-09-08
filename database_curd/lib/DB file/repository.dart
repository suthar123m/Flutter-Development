import 'package:database_curd/DB%20file/DB_connectionn.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  // here is the _databaseConnection is the 'istanse of the Dataconnection Class'

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database> get myDatabase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database!;
    }
  }

  insertRecord(table, data) async {
    var con = await myDatabase;
    return await con.insert(table, data);
  }

  fetchRecord(table) async {
    var con = await myDatabase;
    return await con.query(table);
  }

  fetchsingleRecord(table, data) async {
    var con = await myDatabase;
    return await con.query(table, where: "id = ?", whereArgs: [data["id"]]);
  }

  deleteRecord(table, data) async {
    var con = await myDatabase;
    return await con.delete(table, where: "id = ?", whereArgs: [data["id"]]);
  }

  updateRecord(table, data) async {
    var con = await myDatabase;
    return await con
        .update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }
}
