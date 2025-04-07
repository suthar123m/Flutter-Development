import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_app/Model/CategoryModel.dart';

class CategoryModelService {
  Future<List<CategoryData>> getCategoryData(String category) async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'q': category,
      'apiKey': '7fcfa664182e4c6599cb5572edab68db',
    });

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Response StatusCode :: ${response.statusCode}');
        print('Response Body :: ${response.body}');

        Map<String, dynamic> jsonMap = jsonDecode(response.body);

        List<dynamic> jsonList = jsonMap['articles'];

        return jsonList.map((e) => CategoryData.fromJson(e)).toList();
      } else {
        print('Response StatusCode Error :: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error :: $e');
      throw Exception('Error :: $e');
    }
  }
}
