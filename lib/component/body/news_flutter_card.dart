import 'package:flutter/material.dart';
import 'package:news_flutter_app/component/component_style.dart';
import 'package:news_flutter_app/controller/get_news_api.dart';
import 'package:news_flutter_app/views/news_detail.dart';



Widget newsImage(String url) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.network(url, fit: BoxFit.cover, width: 150, height: 150),
  );
}

Widget newsDetails(
    String title, String author, String name, Duration timeElapsed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      textTitle(title),
      sizeH10,
      textAuthor('By $author'),
      sizeH10,
      newsTime(name, timeElapsed),
    ],
  );
}

Widget newsTime(String name, Duration timeElapsed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(flex: 1, child: textBox(name)),
      Flexible(
        flex: 1,
        child: timeElapsed.inHours > 24
            ? textBox('${timeElapsed.inDays} days ago')
            : textBox('${timeElapsed.inHours} hours ago'),
      ),
    ],
  );
}

Container newsFlutterCard() {
  final article = getNewsContent.article;

  return Container(
    margin: const EdgeInsets.only(top: 180),
    child: ListView.builder(
      itemCount: article.length,
      itemBuilder: (context, index) {
        final scr = article[index];
        final now = DateTime.now();
        final timeElapsed = now.difference(scr.getPublishedAt);
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: boxDecorationCard,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: newsImage(scr.getUrlToImage)),
                sizeW10,
                Expanded(
                  child: newsDetails(
                    scr.getTitle,
                    scr.getAuthor,
                    scr.getName,
                    timeElapsed,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetail(index: index),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
