import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel category;
  int index;

  CategoryWidget(this.category, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(24),
            topLeft: const Radius.circular(24),
            bottomRight: Radius.circular(index.isOdd ? 24 : 0),
            bottomLeft: Radius.circular(index.isEven ? 24 : 0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            category.image,
            height: 110,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
