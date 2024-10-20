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
    this.onTap,
  });

  final MoviesModel moviesModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
                  imageUrl:
                      "${AppConstants.kStaticImgLink}${moviesModel.posterPath}",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
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
                      moviesModel.genre ?? "No Genre",
                      style: AppStyles.stylePoppinsRegular12(),
                    )
                  ],
                ),
                const Gap(4),
                Flexible(
                  fit: FlexFit.loose,
                  child: Row(
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
                ),
                const Gap(4),
              ],
            )
          ],
        ),
      ),
    );
  }
}
