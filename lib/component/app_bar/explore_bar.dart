import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/search_bar.dart';
import 'package:news_flutter_app/component/style.dart';
import 'package:intl/intl.dart';
import 'package:news_flutter_app/controller/filter_search.dart';

// void (str) {
//   getArticles(str);
// }

String formattedDate = DateFormat('EEEE, dd MMMM  yyyy').format(DateTime.now());

Container exploreBar() {
  return Container(
    color: secondaryColor,
    height: 180,
    margin: const EdgeInsets.only(top: 60),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textDateTime(formattedDate),
          textTitle('Explore'),
          sizeH10,
          searchBar(),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buttonAnchor('All', () => filterSearch.setCategory = 'general'),
                buttonAnchor('Technology',
                    () => filterSearch.setCategory = 'technology'),
                buttonAnchor(
                    'Business', () => filterSearch.setCategory = 'business'),
                buttonAnchor(
                    'Health', () => filterSearch.setCategory = 'health'),
                buttonAnchor(
                    'Science', () => filterSearch.setCategory = 'science'),
                buttonAnchor(
                    'Sports', () => filterSearch.setCategory = 'sports'),
                buttonAnchor(
                    'Politics', () => filterSearch.setCategory = 'politics'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
