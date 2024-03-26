import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_flutter_app/controller/filter_search.dart';
import '../models/article.dart';

class GetNewsContent extends FilterSearch {
  final List<Article> article = [];
  Future<void> getArticles() async {
    final response = await http.get(
      Uri.parse(filterSearch.url),
    );
    //convert the response to Map
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    mapArticles(body);
  }

  void mapArticles(body) {
    article.clear();
    for (final item in body['articles']) {
      if (item['urlToImage'] == null ||
          item['author'] == null ||
          item['content'] == null ||
          item['publishedAt'] == null ||
          item['source'] == null ||
          item['title'] == null ||
          item['description'] == null) continue;
      article.add(
        Article.fromMap(item),
      );
    }
  }
}

GetNewsContent getNewsContent = GetNewsContent();
