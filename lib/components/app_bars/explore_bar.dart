import 'package:flutter/material.dart';
import 'package:news_flutter_app/components/app_bars/search_bar.dart';
import 'package:news_flutter_app/components/component_style.dart';
import 'package:intl/intl.dart';
import 'package:news_flutter_app/controllers/filter_search.dart';

List<String> categories = [
  'All',
  'Technology',
  'Business',
  'Health',
  'Science',
  'Sports',
  'Politics',
];

List<Widget> categoryButtons() {
  return categories.map((category) {
    return buttonAnchor(
            category, () => filterSearch.setCategory(category.toLowerCase()));
  }).toList();
}

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
              children: categoryButtons(),
            ),
          )
        ],
      ),
    ),
  );
}
