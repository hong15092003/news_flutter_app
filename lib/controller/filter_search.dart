import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterSearch extends ChangeNotifier {
  String headerAPI = 'https://newsapi.org/v2/top-headlines?';
  String apiKey = 'c6f505c4c0c9495dacc2929ceb6468fa';
  String category = 'general';
  String search = '';
  String dateTimeNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String get url => '${headerAPI}country=us&category=$category&apiKey=$apiKey';

  set setSearch(value) {
    search = value;
    notifyListeners();
  }

  set setCategory(String value) {
    category = value;
    notifyListeners();
  }
}

FilterSearch filterSearch = FilterSearch();
