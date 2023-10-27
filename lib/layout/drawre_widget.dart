import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem index);

class DrawerWidget extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  DrawerWidget(this.onMenuItemClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 120,
          color: const Color(0xFF39A552),
          child: const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Text(
              "News App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 33),
          child: InkWell(
            onTap: () {
              onMenuItemClick(MenuItem.categories);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: InkWell(
            onTap: () {
              onMenuItemClick(MenuItem.settings);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

enum MenuItem { categories, settings }
