import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/bottom_bar/bottom_bar.dart';
import 'package:news_flutter_app/component/app_bar/explore_bar.dart';
import 'package:news_flutter_app/controller/filter_search.dart';
import 'package:news_flutter_app/controller/get_news_api.dart';

import '../component/news_flutter_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: bottomBar(context),
        body: Stack(
          children: [
            ListenableBuilder(
              listenable: filterSearch,
              builder: (context, _) {
                // Replace with your actual builder function
                return FutureBuilder(
                  future: getNewsContent
                      .getArticles(), // Replace with your actual future function
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return newsFlutterCard();
                    }
                  },
                );
              },
            ),
            exploreBar(),
          ],
        ),
      ),
    );
  }
}
