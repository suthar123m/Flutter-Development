import 'package:assignment_sqflite_database/DatabaseFile/modelClass.dart';
import 'package:assignment_sqflite_database/DatabaseFile/repository.dart';

class Taskservice {
  late Repository _repository;
  Taskservice() {
    _repository = Repository();
  }

  insertService(Task_Model TaskModel) {
    return _repository.insertData("Task", TaskModel.Taskdata());
  }

  getservice() {
    return _repository.getdata("Task");
  }

  getspecificservice(Task_Model Task) {
    return _repository.getspecificdata("Task", Task.Taskdata());
  }

  updateservice(Task_Model Task) {
    return _repository.updatedata("Task", Task.Taskdata());
  }

  deleteservice(int? id) {
    return _repository.deletedata("Task", id);
  }
}
