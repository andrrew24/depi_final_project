import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/features/watch_list/manager/cubit/watchlist_cubit.dart';
import 'package:movie_app/utils/widgets/movie_item.dart';

class WatchlistViewBody extends StatelessWidget {
  const WatchlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchlistCubit()..getAllWatchlistMovies(),
      child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is WatchlistSuccess) {
            if (state.moviesList.isNotEmpty) {
              return ListView.separated(
                itemCount: state.moviesList.length,
                separatorBuilder: (context, index) => Gap(10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: WatchlistMovieItem(
                      model: state.moviesList[index],
                    ),
                  );
                },
              );
            } else {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.imgMagicbox),
                    Gap(16),
                    Text(
                      "There is no movie yet!",
                      style: AppStyles.styleMontserratSemiBold16(),
                    ),
                    Gap(8),
                    Text(
                      "Find your movie by Type title, categories, years, etc ",
                      style: AppStyles.styleMontserratMeddium12(),
                    )
                  ],
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}

class WatchlistMovieItem extends StatelessWidget {
  const WatchlistMovieItem({
    super.key,
    required this.model,
  });

  final MovieDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: true,
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(15),
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (context) {
            BlocProvider.of<WatchlistCubit>(context)
                .deleteMovieFromWatchList(model.id!);
          },
        )
      ]),
      child: MovieItem(
        moviesModel: model.toMoviesModel(),
      ),
    );
  }
}
