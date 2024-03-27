import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_flutter_app/controller/filter_search.dart';
import '../models/article.dart';

class GetNewsContent extends FilterSearch {
  final List<Article> article = [];

  Future<http.Response> fetchArticles() {
    return http.get(Uri.parse(filterSearch.url));
  }

  Map<String, dynamic> decodeResponse(http.Response response) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  bool isValidArticle(Map<String, dynamic> item) {
    return item['urlToImage'] != null &&
        item['author'] != null &&
        item['content'] != null &&
        item['publishedAt'] != null &&
        item['source'] != null &&
        item['title'] != null &&
        item['description'] != null;
  }

  Future<void> getArticles() async {
    final response = await fetchArticles();
    final body = decodeResponse(response);
    mapArticles(body);
    debugPrint(filterSearch.url);
  }

  void mapArticles(body) {
    article.clear();
    for (final item in body['articles']) {
      if (!isValidArticle(item)) continue;
      article.add(Article.fromMap(item));
    }
  }
}

GetNewsContent getNewsContent = GetNewsContent();