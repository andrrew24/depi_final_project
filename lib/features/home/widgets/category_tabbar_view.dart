import 'package:flutter/material.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/home/widgets/categoy_movies_gridview.dart';

class CategoryTabBarView extends StatelessWidget {
  const CategoryTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColor.rateOrangeColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: AppStyles.stylePoppinsRegular14(),
            tabs: const [
              Tab(text: 'Now playing'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Top rated'),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                CategoryMoviesGridView(
                  endpoint: AppConstants.kNowPlayingCategory,
                ),
                CategoryMoviesGridView(
                  endpoint: AppConstants.kUpcomingCategory,
                ),
                CategoryMoviesGridView(
                  endpoint: AppConstants.kTopRatedCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
