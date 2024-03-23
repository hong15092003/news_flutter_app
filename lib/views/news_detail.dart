import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/app_bar/detail_bar.dart';
import 'package:news_flutter_app/component/style.dart';
import 'package:news_flutter_app/controller/get_news_api.dart';

class NewsDetail extends StatelessWidget {
  final int index;
  const NewsDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article = getNewsContent.article;
    dynamic scr = article[index];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: detailBar(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  scr.urlToImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              sizeH10,
              textAuthor('#${scr.getName}'),
              sizeH10,
              textTitle(scr.getTitle),
              sizeH10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textDateTime(scr.getDateTime),
                  textAuthor('By ${scr.author}'),
                ],
              ),
              sizeH10,
              textContent(scr.content),
            ],
          ),
        ),
      ),
    );
  }
}
