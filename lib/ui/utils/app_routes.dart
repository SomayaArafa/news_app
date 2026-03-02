import 'package:flutter/material.dart';
import 'package:news_app/apis/model/category.dart';
import 'package:news_app/ui/screens/categories/categories_screen.dart';
import 'package:news_app/ui/screens/navigation/navigation_screen.dart';

abstract final class AppRoutes {
  static Route  newsScreen(AppCategory category)  =>
      MaterialPageRoute(builder: (_) => NewsScreen(category));
  static Route get categoriesScreen =>
      MaterialPageRoute(builder: (_) => CategoriesScreen());

}