import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/component_style.dart';
import 'package:news_flutter_app/controller/filter_search.dart';

const searchIcon = Icon(Icons.search_rounded);

MaterialStateProperty<double> elevationProperty() {
  return MaterialStateProperty.all<double>(0);
}

MaterialStateProperty<Color> backgroundColorProperty() {
  return MaterialStateProperty.all<Color>(shadowColor);
}

MaterialStateProperty<EdgeInsetsGeometry> paddingProperty() {
  return MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
  );
}

MaterialStateProperty<OutlinedBorder> shapeProperty() {
  return MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

SearchBar searchBar() {
  return SearchBar(
    elevation: elevationProperty(),
    backgroundColor: backgroundColorProperty(),
    padding: paddingProperty(),
    shape: shapeProperty(),
    leading: searchIcon,
    onSubmitted: (value) => filterSearch.setSearch(value),
  );
}