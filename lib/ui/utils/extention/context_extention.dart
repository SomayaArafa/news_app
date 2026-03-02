import 'package:flutter/material.dart';

String x = "";

extension SDASSD on String {
  ahmed() {
    print("Asdasdasd");
  }
}

extension BuildContextExtension on BuildContext {
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  Color get primaryColor => Theme.of(this).primaryColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}