import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/api/api.dart';
import '../../data/api/models/news_model.dart';

class Services {
  static Future<List<NewsModel>?> getData() async {
    var client = http.Client();
    var uri = Uri.parse(newsApi);
    try {
      var response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        List<NewsModel> list = parseUsers(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<NewsModel> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
  }
}
