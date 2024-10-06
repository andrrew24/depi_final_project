import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/config/constants/app_assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.imgCalendarBlank),
        Text(
          ' 2021 | ',
          style: AppStyles.styleMontserratMeddium12(),
        ),
        SvgPicture.asset(AppAssets.imgClock),
        Text(
          ' 148 minutes | ',
          style: AppStyles.styleMontserratMeddium12(),
        ),
        SvgPicture.asset(AppAssets.imgTicket),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            ' Action',
            style: AppStyles.styleMontserratMeddium12(),
          ),
        ),
      ],
    );
  }
}
