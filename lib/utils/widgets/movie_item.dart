import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/constants/assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
  });

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
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(Assets.imgDefaultmovieimg))),
          ),
          const Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Spider Man",
                style: AppStyles.stylePoppinsRegular16(),
              ),
              const Gap(14),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imgStar,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    "8.5",
                    style: AppStyles.styleMontserratSemiBold12(),
                  )
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imgTicket,
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
                    Assets.imgCalendarBlank,
                    width: 20,
                  ),
                  const Gap(5),
                  Text(
                    "2019",
                    style: AppStyles.stylePoppinsRegular12(),
                  )
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imgClock,
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
