import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/theme.dart';
import 'package:movie_app/features/details/views/details_view.dart';
import 'package:movie_app/service/api_service.dart';

void main() async {
  // load variables in .env file (placed in the root project folder)
  await dotenv.load(fileName: ".env");

  runApp(const MoviesApp());

  final network = NetworkService();
  try {
    final res = await network.getMovieById(672);
    print(res);
    print(res.toJson());
  } catch (error) {
    print("error is $error");
  }

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColor.appBackgroundColor));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const DetailsView(),
    );
  }
}
