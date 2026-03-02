import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode =ThemeMode.light;
  bool get isLightMode => themeMode == ThemeMode.light;

  changeThemeMode(ThemeMode newThemeMode){
    themeMode=newThemeMode;
    notifyListeners();
  }
}