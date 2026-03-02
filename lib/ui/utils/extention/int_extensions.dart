import 'package:flutter/material.dart';

extension IntExtensions on int {
  SizedBox verticalSpace() => SizedBox(height: this.toDouble(),);

  SizedBox horizontalSpace() => SizedBox(
    width: this.toDouble(),
  );
}