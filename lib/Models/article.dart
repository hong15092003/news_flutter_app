import 'package:intl/intl.dart';

const dateFormat = 'EEEE, dd MMMM  yyyy';

class Article {
  final dynamic source;
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    this.source,
    this.title,
    this.author,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }

  List<String> splitTitle() {
    return title!.split('|');
  }

  String get getAuthor => author ?? 'Unknown';
  String get getName => '${source['name']}';
  String get getTitle => splitTitle()[0];
  String get getUrlToImage => urlToImage ?? '';
  DateTime get getPublishedAt => DateTime.parse(publishedAt!);
  String get getDateTime => DateFormat(dateFormat).format(getPublishedAt);
}

