import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/widgets/details.dart';
import 'package:movie_app/features/details/widgets/tab_bar/tab_bar.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage(AppAssets.imgDefaultmoviebackground))),
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
                            "9.5",
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
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      AppAssets.imgDefaultmovieimg))),
                        ),
                        const Gap(12),
                        Text(
                          "Spiderman No Way Home",
                          style: AppStyles.stylePoppinsSemiBold18(),
                        )
                      ],
                    ),
                    const Gap(25),
                    const Details(),
                  ],
                ),
              )
            ],
          ),
        ),
        const Gap(160),
        const Expanded(
          child: TabBarCustom(),
        )
      ],
    );
  }
}
