import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryProductController extends GetxController {
  var categories = <String>[].obs;
  var selectedCategory = ''.obs;
  var products = [].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    var snapshot = await FirebaseFirestore.instance.collection('Products').get();

    var uniqueCategories = snapshot.docs
        .map((doc) => doc['ProductCategoty'] as String)
        .toSet()
        .toList();

    categories.assignAll(uniqueCategories);

    if (uniqueCategories.isNotEmpty) {
      selectCategory(uniqueCategories.first);
    }
  }

  void selectCategory(String category) async {
    selectedCategory.value = category;

    var snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('ProductCategoty', isEqualTo: category)
        .get();

    products.assignAll(snapshot.docs);
  }
}
