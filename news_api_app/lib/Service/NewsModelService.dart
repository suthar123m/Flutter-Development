import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_app/Model/NewsModel.dart';

class NewsViewModel {
  Future<List<NewsArticles>> getNewsAPI() async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': '7fcfa664182e4c6599cb5572edab68db'
    });
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Response Status Code : ${response.statusCode}');
        print('Response Body : ${response.body}');

        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        List<dynamic> articles = jsonResponse['articles'];
        return articles.map((e) => NewsArticles.fromJson(e)).toList();
      } else {
        print('Error Response Status Code : ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error :: $e');
      return [];
    }
  }
}
