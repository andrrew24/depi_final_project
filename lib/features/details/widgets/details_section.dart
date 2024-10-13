import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.model});

  final MovieDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.imgCalendarBlank),
        Text(
          ' ${model.releaseDate!.substring(0, 4)} | ',
          style: AppStyles.styleMontserratMeddium12(),
        ),
        SvgPicture.asset(AppAssets.imgClock),
        Text(
          ' ${model.runtime} minutes | ',
          style: AppStyles.styleMontserratMeddium12(),
        ),
        SvgPicture.asset(AppAssets.imgTicket),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            ' ${model.genres![0].name}',
            style: AppStyles.styleMontserratMeddium12(),
          ),
        ),
      ],
    );
  }
}
