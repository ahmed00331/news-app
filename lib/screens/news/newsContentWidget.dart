import 'package:flutter/material.dart';

import '../../models/NewsResponse/Articles.dart';

class NewsContentWidget extends StatelessWidget {
  Articles articles;

  NewsContentWidget(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(articles.urlToImage ?? ""),
      ],
    );
  }
}
