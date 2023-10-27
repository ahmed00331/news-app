import 'package:flutter/material.dart';

import '../../models/sourcesResponse/Source.dart';
import '../../shared/network/remote/api_manager.dart';
import 'newsWidget.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;

  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  bool isLoadingMore = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(sourceId: widget.source.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Center(
              child: Text(snapshot.data?.message ?? snapshot.error.toString()),
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < newsList.length) {
                return NewsWidget(newsList[index]);
              } else {
                return const CircularProgressIndicator();
              }
            },
            itemCount: isLoadingMore ? newsList.length + 1 : newsList.length,
          );
        });
  }

  Future<void> fetchArticles() async {
    setState(() {
      ApiManager.getNews();
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      await fetchArticles();
      setState(() {
        isLoadingMore = true;
      });
    }
  }
}
