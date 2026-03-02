import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.white,
          secondary: AppColors.black),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20),
          elevation: 0),
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.black,
        labelStyle: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      textTheme: const TextTheme(
          displaySmall: TextStyle(
              fontSize: 26,
              color: AppColors.white,
              fontWeight: FontWeight.w500),
          titleLarge: TextStyle(
              fontSize: 24,
              color: AppColors.black,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          )));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.black,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          secondary: AppColors.white),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,
          titleTextStyle: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20),
          elevation: 0, iconTheme: IconThemeData(color: AppColors.white)),
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.white,
        labelStyle: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Colors.white, fontSize: 26),
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          labelMedium: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500)));
}