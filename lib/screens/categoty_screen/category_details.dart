import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categoty_screen/sources_tabs.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class CategoryDetails extends StatelessWidget {
  CategoryModel category;

  CategoryDetails(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(snapshot.data?.message ?? snapshot.error.toString()),
            ),
          );
        }
        var sourcesList = snapshot.data?.sources;
        return SourcesTabs(sourcesList!);
      },
    );
  }
}
