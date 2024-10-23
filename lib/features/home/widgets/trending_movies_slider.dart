import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/features/home/viewmodels/trending_cubit/trending_cubit.dart';
import 'package:movie_app/features/home/widgets/simple_movie_item.dart';
import 'package:movie_app/utils/widgets/movie_item.dart';
import 'package:movie_app/utils/widgets/myerror_widget.dart';


class TrendingMoviesSlider extends StatelessWidget {
  const TrendingMoviesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        if (state is TrendingLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrendingFailure) {
          return MyErrorWidget(errorMessage: state.errorMessage);
        } else if (state is TrendingSuccess) {
          return SizedBox(
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.moviesList.length,
                separatorBuilder: (context, index) => Gap(10),
                itemBuilder: (context, index) {
                  return SimpleMovieItem(model: state.moviesList[index]);
                },
              ));
        }
        return Container();
      },
    );
  }
}
