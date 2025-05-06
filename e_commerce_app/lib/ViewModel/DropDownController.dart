import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = 'User'.obs;
  var items = ['User', 'Admin' ].obs;

  void changeValue(String value) {
    selectedValue.value = value;
  }
}
