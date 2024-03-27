import 'package:flutter/material.dart';
import 'package:news_flutter_app/components/component_style.dart';

const homeIcon = Icon(Icons.home);
const searchIcon = Icon(Icons.search);
const bookmarkIcon = Icon(Icons.bookmark);
const personIcon = Icon(Icons.person);

Padding bottomBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        button(homeIcon, () {}),
        button(searchIcon, () {}),
        button(bookmarkIcon, () {}),
        button(personIcon, () {}),
      ],
    ),
  );
}
