import 'package:get/get.dart';
import 'package:news_api_app/Model/CategoryModel.dart';
import 'package:news_api_app/Service/CategoryModelSercive.dart';

class CategoryModelController extends GetxController {
  var categoryList = <CategoryData>[].obs;

  fetchCategorydata(String category) async {
    try {
      var newsmodelcontroller =
          await CategoryModelService().getCategoryData(category);
      categoryList.value = newsmodelcontroller;
    } catch (error) {
      throw Exception('Error While Getx Controller :: $error');
    }
  }
}
