import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/bottom_bar.dart';
import 'package:news_flutter_app/component/app_bar/explore_bar.dart';
import 'package:news_flutter_app/controller/filter_search.dart';
import 'package:news_flutter_app/controller/get_news_api.dart';

import '../component/news_flutter_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final article = getNewsContent.article;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomBar(context),
        body: FutureBuilder<void>(
          future: getNewsContent.getArticles(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                if (article.isNotEmpty) {
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 180),
                        child: ListView.builder(
                          itemCount: article.length,
                          itemBuilder: (context, index) {
                            return newsFlutterCard(index, context);
                          },
                        ),
                      ),
                      exploreBar(),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      child: ListView.builder(
                        itemCount: article.length,
                        itemBuilder: (context, index) {
                          return newsFlutterCard(index, context);
                        },
                      ),
                    ),
                    exploreBar(),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
