import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_app/Model/NewsHeadlineModel.dart';

class NewsHeadlineModelService {
  Future<List<NewsArticlesHeadline>> newsHeadlineModel(String newsChenal) async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'sources': newsChenal,
      'apiKey': '7fcfa664182e4c6599cb5572edab68db',
    });

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Json Response Status Code : ${response.statusCode}');
        print('Json Response body : ${response.body}');

        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        List<dynamic> jsonList = jsonMap['articles'];
        return jsonList.map((e) => NewsArticlesHeadline.fromJson(e)).toList();
      } else {
        print('Error Response Status Code : ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error :: $error');
      return [];
    }
  }
}
