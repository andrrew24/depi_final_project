import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.appBackgroundColor);
}
