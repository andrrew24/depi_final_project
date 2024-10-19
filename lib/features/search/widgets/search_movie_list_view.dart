import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/features/details/views/details_view.dart';
import 'package:movie_app/features/home/models/movies_model.dart';
import 'package:movie_app/features/search/widgets/search_movie_item.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({
    super.key,
    required this.movies,
  });

  final List<MoviesModel> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: movies.length,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) {
        return MovieItem(
          moviesModel: movies[index],
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailsView(movieId: movies[index].id!);
              },
            ));
          },
        );
      },
    );
  }
}
