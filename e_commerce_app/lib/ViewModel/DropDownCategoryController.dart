import 'package:get/get.dart';

class Dropdowncategorycontroller extends GetxController {
  var selectedValue = 'Man'.obs;
  var items =
      [
        'Man',
        'Woman',
        'Child',
        'Electronics',
        'Fashion',
        'Home',
        'Grocery',
        'Sports',
      ].obs;

  void changeValue(String value) {
    selectedValue.value = value;
  }
}
