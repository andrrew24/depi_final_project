import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/bloc_observer.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/config/theme/theme.dart';
import 'package:movie_app/features/home/viewmodels/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home/viewmodels/trending_cubit/trending_cubit.dart';
import 'package:movie_app/features/home/views/home.dart';
import 'package:movie_app/features/search/viewmodels/cubit/search_cubit.dart';
import 'package:movie_app/features/splash_screen/views/splash_screen.dart';

void main() async {
  // Bloc observer
  Bloc.observer = AppBlocObserver();
  // init Hive
  await Hive.initFlutter();
  // open watchlist box
  await Hive.openBox(AppConstants.kWatchlistBox);
  // load variables in .env file (placed in the root project folder)
  await dotenv.load(fileName: ".env");
  //setup service locator for dependency inject
  setupServiceLocator();

  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => TrendingCubit()..getTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          initialRoute: "/splash",
          routes: {
            '/splash': (context) => const SplashScreen(durationInSeconds: 5),
            '/home': (context) => const Home(),
          }),
    );
  }
}
