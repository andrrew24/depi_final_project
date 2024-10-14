import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class SearchNoResultWidget extends StatelessWidget {
  const SearchNoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.imgNoresults),
        const Gap(15),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            "we are sorry, we can not find the movie :(",
            textAlign: TextAlign.center,
            style: AppStyles.styleMontserratSemiBold16(),
          ),
        ),
        const Gap(10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            "Find your movie by Type title, categories, years, etc ",
            textAlign: TextAlign.center,
            style: AppStyles.styleMontserratMeddium12(),
          ),
        ),
      ],
    ));
  }
}
