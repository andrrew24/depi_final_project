import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/viewmodels/trending_cubit/trending_cubit.dart';
import 'package:movie_app/features/home/widgets/simple_movie_item.dart';

class TrendingMoviesSlider extends StatelessWidget {
  const TrendingMoviesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrendingFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is TrendingSuccess) {
            return SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: state.moviesList.length,
                itemBuilder: (context, index, realIndex) {
                  return SimpleMovieItem(model: state.moviesList[index]);
                },
                options: CarouselOptions(
                    viewportFraction: 0.34,
                    padEnds: false,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeFactor: 0.1666),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
