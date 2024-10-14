import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/features/details/viewmodels/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/features/details/widgets/details_section.dart';
import 'package:movie_app/features/details/widgets/tab_bar/tab_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieDetailsSuccess) {
          return MovieDetailsWidget(
            model: state.movieDetailsModel,
          );
        }
        return const Center(
          child: Text("There is Unknown Error"),
        );
      },
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.model,
  });

  final MovieDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                      imageUrl:
                          "${AppConstants.kStaticImgLink}${model.backdropPath}"),
                ),
              ),

              // Rating Widget
              Positioned(
                right: 10,
                bottom: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.imgStar),
                          const Gap(5),
                          Text(
                            model.voteAverage!.toStringAsFixed(1),
                            style: AppStyles.styleMontserratSemiBold12()
                                .copyWith(color: AppColor.rateOrangeColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Details Body
              Positioned(
                bottom: -150,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                                imageUrl:
                                    "${AppConstants.kStaticImgLink}${model.posterPath}"),
                          ),
                        ),
                        const Gap(10),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 200),
                          child: Text(
                            model.title ?? "No Title",
                            style: AppStyles.stylePoppinsSemiBold18(),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                    const Gap(25),
                    DetailsSection(
                      model: model,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Gap(160),
        Expanded(
          child: TabBarCustom(
            model: model,
          ),
        )
      ],
    );
  }
}
