import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const whiteTextStyle = TextStyle(color: Colors.white);
final grey850Color = Colors.grey[850];

MarkdownStyleSheet markdownStyleSheet() {
  return MarkdownStyleSheet(
    a: whiteTextStyle,
    p: whiteTextStyle,
    code: whiteTextStyle.copyWith(backgroundColor: Colors.transparent),
    h1: whiteTextStyle,
    h2: whiteTextStyle,
    h3: whiteTextStyle,
    h4: whiteTextStyle,
    h5: whiteTextStyle,
    h6: whiteTextStyle,
    em: whiteTextStyle,
    strong: whiteTextStyle,
    del: whiteTextStyle,
    blockquote: whiteTextStyle,
    img: whiteTextStyle,
    checkbox: whiteTextStyle,
    tableHead: whiteTextStyle,
    tableBody: whiteTextStyle,
    listBullet: whiteTextStyle,
    codeblockDecoration: BoxDecoration(
      color: grey850Color,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: grey850Color!,
      ),
      boxShadow: const [],
    ),
  );
}

extension MarkdownExtensions on String {
  Widget toMarkdown(data) {
    return MarkdownBody(
      selectable: true,
      data: data,
      styleSheet: markdownStyleSheet(),
    );
  }
}
