import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/home/models/movies_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.moviesModel,
  });

  final MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: moviesModel.backdropPath == null
                    ? AppConstants.kNoImgPreviewLink
                    : "${AppConstants.kStaticImgLink}${moviesModel.backdropPath}",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  moviesModel.title ?? "No name",
                  style: AppStyles.stylePoppinsRegular16(),
                ),
              ),
              const Gap(14),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.imgStar,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    moviesModel.voteAverage == null
                        ? "No Rating"
                        : moviesModel.voteAverage!.toStringAsFixed(1),
                    style: AppStyles.styleMontserratSemiBold12(),
                  )
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.imgTicket,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    "Action",
                    style: AppStyles.stylePoppinsRegular12(),
                  )
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.imgCalendarBlank,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    moviesModel.releaseDate ?? "NO Date",
                    style: AppStyles.stylePoppinsRegular12(),
                  )
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.imgClock,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    "139",
                    style: AppStyles.stylePoppinsRegular12(),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
