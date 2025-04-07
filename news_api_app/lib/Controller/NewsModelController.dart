import 'package:get/get.dart';
import 'package:news_api_app/Model/NewsModel.dart';
import 'package:news_api_app/Service/NewsModelService.dart';

class NewsModelController extends GetxController {
  var newsModelList = <NewsArticles>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchnewscontroller();
  }

  fetchnewscontroller() async {
    try {
      var newsmodelcontroller = await NewsViewModel().getNewsAPI();
      newsModelList.value = newsmodelcontroller;
    } catch (error) {
      throw Exception('Error While Getx Controller :: $error');
    }
  }
}
