import 'package:get/get.dart';
import 'package:news_api_app/Model/NewsHeadlineModel.dart';
import 'package:news_api_app/Service/NewsHeadlineModelService.dart';

class NewsHeadlineModelController extends GetxController {
  var newsHeadlineControllerList = <NewsArticlesHeadline>[].obs;

  fetchnewsheadlinecontroller(String newsChenal) async {
    try {
      var newsheadlinecontroller =
          await NewsHeadlineModelService().newsHeadlineModel(newsChenal);
      newsHeadlineControllerList.value = newsheadlinecontroller;
    } catch (error) {
      throw Exception('Error While Getx Controller :: $error');
    }
  }
}
