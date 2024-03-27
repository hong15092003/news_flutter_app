import 'package:flutter/material.dart';
import 'package:news_flutter_app/controllers/filter_search.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    Provider(
      create: (_) => FilterSearch(),
      child: const HomePage(),
    ),
  );
}

