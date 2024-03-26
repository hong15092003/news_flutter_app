import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterSearch extends ChangeNotifier {
  String header = 'https://newsapi.org/v2/top-headlines?';
  String headerHeadlines = 'https://newsapi.org/v2/top-headlines?';
  String headerEverything = 'https://newsapi.org/v2/everything?';

  String apiKey = 'c6f505c4c0c9495dacc2929ceb6468fa';
  String category = 'general';
  String search = '';
  String dateTimeNow = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String get url => '${header}country=us&category=$category&apiKey=$apiKey';

  set setSearch(value) {
    search = value;
    header = headerEverything;
    notifyListeners();
  }

  void setCategory(String value) {
    category = value;
    header = headerHeadlines;
    notifyListeners();
  }
}

FilterSearch filterSearch = FilterSearch();
