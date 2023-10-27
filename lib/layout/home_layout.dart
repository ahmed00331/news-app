import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categoty_screen/category_details.dart';
import 'package:news_app/screens/categoty_screen/category_screen.dart';

import '../screens/settings_screen/settings_screen.dart';
import 'drawre_widget.dart';
import 'newsSearch.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoryScreen(onCategoryItemClick);
  }

  List<CategoryModel> categoryModel = CategoryModel.getAllCategory();

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        drawer: DrawerWidget(onClick),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search_outlined,
                size: 30,
              ),
              onPressed: () {
                showSearch(context: context, delegate: NewsSearch());
              },
            ),
          ],
          title: Text("News App"),
        ),
        body: selectedWidget,
      ),
    );
  }


  late Widget selectedWidget;

  void onClick(MenuItem item) {
    Navigator.pop(context);

    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoryScreen(onCategoryItemClick);
        }

      case MenuItem.settings:
        {
          selectedWidget = SettingsScreen();
        }
    }

    setState(() {});
  }

  void onCategoryItemClick(CategoryModel category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
