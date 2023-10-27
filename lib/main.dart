import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/screens/news/news_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF39A552),
        ),
        primaryColor: Color(0xFF39A552),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: Color(0xFF39A552),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        NewsContent.routeName: (context) => NewsContent(),
      },
    );
  }
}
