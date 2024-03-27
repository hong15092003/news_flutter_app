import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const headerHeadlines = 'https://newsapi.org/v2/top-headlines?';
const headerEverything = 'https://newsapi.org/v2/everything?';
const apiKey = 'c6f505c4c0c9495dacc2929ceb6468fa';

class FilterSearch extends ChangeNotifier {
  String? _url;
  String category = 'general';

  DateTime get yesterday => DateTime.now().subtract(const Duration(days: 1));
  String get yesterdayFormat => DateFormat('yyyy-MM-dd').format(yesterday);

  String generateEverythingUrl(String value) {
    return '${headerEverything}q=$value&from=$yesterdayFormat&sortBy=publishedAt&apiKey=$apiKey';
  }

  String generateHeadlinesUrl() {
    return '${headerHeadlines}country=us&category=$category&apiKey=$apiKey';
  }

  set url(String? value) {
    _url =
        value != null ? generateEverythingUrl(value) : generateHeadlinesUrl();
  }

  String get url => _url!;

  void setSearch(String? value) {
    url = value?.isEmpty ?? true ? null : value;
    notifyListeners();
  }

  void setCategory(String value) {
    category = value;
    url = null;
    notifyListeners();
  }
}

FilterSearch filterSearch = FilterSearch();
