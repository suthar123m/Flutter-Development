class SetDatabaseClass {
  int? id;
  String? name;
  String? email;
  String? age;
  String? contact;

  setMap() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id ?? null;
    mapping['name'] = name;
    mapping['email'] = email;
    mapping['age'] = age;
    mapping['contact'] = contact;

    return mapping;
  }
}
