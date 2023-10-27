import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/news/newsWidget.dart';
import '../shared/network/remote/api_manager.dart';

class NewsSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          elevation: 10,
          color: Color(0xFF39A552),
          titleTextStyle: TextStyle(backgroundColor: Colors.white)
          //app bar color I wanted
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        onPressed: () => showResults(context),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(searchKeyWord: query),
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
            itemBuilder: (context, index) {
              return NewsWidget(newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(searchKeyWord: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
