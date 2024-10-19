import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/viewmodels/cubit/cast_cubit.dart';
import 'package:movie_app/features/details/viewmodels/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/features/details/viewmodels/review_cubit/review_cubit.dart';
import 'package:movie_app/features/details/widgets/details_view_body.dart';
import 'package:movie_app/features/watch_list/manager/cubit/togglewatchlist_cubit.dart';
import 'package:movie_app/service/local_data_source.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          hasBG: false,
          title: Text(
            'Details',
            style: AppStyles.styleMontserratSemiBold16(),
          ),
          trailingWidget: BlocProvider(
            create: (context) => TogglewatchlistCubit(),
            child: BlocBuilder<TogglewatchlistCubit, TogglewatchlistState>(
              builder: (context, state) {
                if (state is TogglewatchlistInitial) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<TogglewatchlistCubit>(context)
                          .toggleWatchlist(movieId);
                    },
                    icon: Icon(sl<LocalDataSource>().isWatchListed(movieId)
                        ? Icons.bookmark
                        : Icons.bookmark_border_rounded),
                  );
                } else if (state is TogglewatchlistSuccess) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<TogglewatchlistCubit>(context)
                          .toggleWatchlist(movieId);
                    },
                    icon: Icon(sl<LocalDataSource>().isWatchListed(movieId)
                        ? Icons.bookmark
                        : Icons.bookmark_border_rounded),
                  );
                }
                return Container();
              },
            ),
          )),
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              MovieDetailsCubit()..getMovieDetailsById(movieId),
        ),
        BlocProvider(
          create: (context) => ReviewCubit()..getMovieReviews(movieId),
        ),
        BlocProvider(
          create: (context) => CastCubit()..getMovieCast(movieId),
        ),
      ], child: const DetailsViewBody()),
    );
  }
}
