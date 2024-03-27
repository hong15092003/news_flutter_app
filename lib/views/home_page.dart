import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/bottom_bar/bottom_bar.dart';
import 'package:news_flutter_app/component/app_bar/explore_bar.dart';
import 'package:news_flutter_app/controller/filter_search.dart';
import 'package:news_flutter_app/controller/get_news_api.dart';

import '../component/body/news_flutter_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  FutureBuilder newsContentBuilder() {
    return FutureBuilder(
      future: getNewsContent.getArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          if (getNewsContent.article.isEmpty) {
            return const Center(child: Text('Không tìm thấy bài viết nào!'));
          }
          return newsFlutterCard();
        }
      },
    );
  }

  Stack homePageStack() {
    return Stack(
      children: [
        ListenableBuilder(
          listenable: filterSearch,
          builder: (context, _) => newsContentBuilder(),
        ),
        exploreBar(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    filterSearch.url = null;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomBar(context),
        body: homePageStack(),
      ),
    );
  }
}
