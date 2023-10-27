import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categoty_screen/category_widget.dart';

typedef OnCategoryClick = void Function(CategoryModel category);

class CategoryScreen extends StatelessWidget {
  OnCategoryClick onCategoryClick;

  CategoryScreen(this.onCategoryClick, {super.key});

  List<CategoryModel> categories = CategoryModel.getAllCategory();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 14),
            child: Text(
              ''' Pick your category
 of interest''',
              style: TextStyle(
                  color: Color(0xff4F5A69),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryWidget(categories[index], index)),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
