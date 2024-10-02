import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/theme.dart';
import 'package:movie_app/features/home/views/home.dart';

void main() {
  runApp(const MoviesApp());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.appBackgroundColor));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const Home(),
    );
  }
}