import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/config/theme/theme.dart';
import 'package:movie_app/features/details/views/details_view.dart';
import 'package:movie_app/features/home/views/home.dart';

void main() async {
  // load variables in .env file (placed in the root project folder)
  await dotenv.load(fileName: ".env");
  runApp(const MoviesApp());


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
