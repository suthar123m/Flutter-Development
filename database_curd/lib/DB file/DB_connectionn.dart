import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();

    var path = join(directory.path, 'MyDatabase.db');

    var database = await openDatabase(path, version: 1, onCreate: createTable);

    return database;
  }

  Future<void> createTable(Database database, int version) async {
    String? sql =
        "CREATE TABLE DatabaseUser (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT,age TEXT,contact TEXT)";

    await database.execute(sql);
  }
}
