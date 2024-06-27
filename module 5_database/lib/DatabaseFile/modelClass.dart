class Task_Model {
  int? id;
  String? name;
  String? description;
  String? date;
  String? priority;

  Taskdata() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id ?? null;
    mapping["name"] = name;
    mapping["description"] = description;
    mapping["date"] = date;
    mapping["priority"] = priority;
    return mapping;
  }
}
