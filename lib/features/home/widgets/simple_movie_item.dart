import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/features/details/views/details_view.dart';
import 'package:movie_app/features/home/models/movies_model.dart';

class SimpleMovieItem extends StatelessWidget {
  const SimpleMovieItem({
    super.key,
    required this.model,
  });

  final MoviesModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailsView(movieID: model.id!);
          },
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: "${AppConstants.kStaticImgLink}${model.posterPath}",
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
