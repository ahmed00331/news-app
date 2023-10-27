import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryModel(this.id, this.title, this.image, this.color);

  static List<CategoryModel> getAllCategory() {
    return [
      CategoryModel("sports", "Sports", "assets/images/ball.png",
          const Color(0xFFC91C22)),
      CategoryModel("general", "General", "assets/images/Politics.png",
          const Color(0xFF003E90)),
      CategoryModel("health", "Health", "assets/images/health.png",
          const Color(0xffED1E79)),
      CategoryModel("business", "Business", "assets/images/bussines.png",
          const Color(0xffCF7E48)),
      CategoryModel("entertainment", "Entertainment",
          "assets/images/environment.png", const Color(0xff4882CF)),
      CategoryModel("science", "Science", "assets/images/science.png",
          const Color(0xffF2D352))
    ];
  }
}
