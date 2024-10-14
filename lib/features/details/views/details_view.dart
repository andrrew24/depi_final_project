import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/viewmodels/cubit/cast_cubit.dart';
import 'package:movie_app/features/details/viewmodels/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/features/details/viewmodels/review_cubit/review_cubit.dart';
import 'package:movie_app/features/details/widgets/details_view_body.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movieID});

  final int movieID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hasBG: false,
        title: Text(
          'Details',
          style: AppStyles.styleMontserratSemiBold16(),
        ),
        trailingIcon: FontAwesomeIcons.solidBookmark,
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              MovieDetailsCubit()..getMovieDetailsById(movieID),
        ),
        BlocProvider(
          create: (context) => ReviewCubit()..getMovieReviews(movieID),
        ),
        BlocProvider(
          create: (context) => CastCubit()..getMovieCast(movieID),
        ),
      ], child: const DetailsViewBody()),
    );
  }
}
