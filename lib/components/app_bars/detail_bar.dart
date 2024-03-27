import 'package:flutter/material.dart';
import 'package:news_flutter_app/views/home_page.dart';

const backIcon = Icon(Icons.arrow_back_ios_rounded);
const bookmarkIcon = Icon(Icons.bookmark_border_rounded);

IconButton backButton(BuildContext context) {
  return IconButton(
    icon: backIcon,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    },
  );
}

IconButton bookmarkButton() {
  return IconButton(
    onPressed: () {},
    icon: bookmarkIcon,
  );
}

AppBar detailBar(BuildContext context) {
  return AppBar(
    title: const Text('Detail'),
    leading: backButton(context),
    actions: [bookmarkButton()],
  );
}