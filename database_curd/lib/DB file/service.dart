import 'package:database_curd/DB%20file/modelClass.dart';
import 'package:database_curd/DB%20file/repository.dart';

class DatabaseService {
  late Repository _repository;

  DatabaseService() {
    _repository = Repository();
  }

  insertService(table, SetDatabaseClass setDatabaseClass) async {
    return await _repository.insertRecord(table, setDatabaseClass.setMap());
  }

  readService(table) async {
    return await _repository.fetchRecord(table);
  }

  updateService(table, SetDatabaseClass setDatabaseClass) async {
    return await _repository.updateRecord(table, setDatabaseClass.setMap());
  }

  deleteService(table, SetDatabaseClass setDatabaseClass) async {
    return await _repository.deleteRecord(table, setDatabaseClass.setMap());
  }
}
