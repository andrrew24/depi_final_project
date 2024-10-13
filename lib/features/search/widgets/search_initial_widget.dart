import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class SearchInitialWidget extends StatelessWidget {
  const SearchInitialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.imgNoresults,
          ),
          const Gap(15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              "Get a popcorn and start searching now ( ;",
              textAlign: TextAlign.center,
              style: AppStyles.styleMontserratSemiBold16(),
            ),
          )
        ],
      ),
    );
  }
}
