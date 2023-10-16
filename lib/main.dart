import 'package:flutter/material.dart';
import 'package:news_project/category_details.dart';
import 'package:news_project/home_screen.dart';
import 'my_theme.dart';
import 'new_content.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: CategoryDetails.routeName,
    routes: {
      HomeScreen.routeName:(context)=>HomeScreen(),
      CategoryDetails.routeName:(context)=>CategoryDetails(),
      NewsContent.routeName:(context)=>NewsContent(),
    },
    theme: MyTheme.lightMode,
    debugShowCheckedModeBanner: false,
  ));
}

