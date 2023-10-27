import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsResponse/NewsResponse.dart';
import 'package:news_app/models/sourcesResponse/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "810d95abca504ff9932662be7b530eec",
      "category": categoryId,
    });

    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonData);
    return data;
  }

  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyWord}) async {
    Uri url = Uri.https("newsapi.org", "v2/everything", {
      "apiKey": "c6c32953197e472faa5deb3ab6ea6977",
      "sources": sourceId,
      "content": "content",
      "q": searchKeyWord
    });

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(jsonData);
    return newsResponse;
  }
}
