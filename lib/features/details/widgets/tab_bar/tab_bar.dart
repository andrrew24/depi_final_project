import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_color.dart';
import 'package:movie_app/features/details/widgets/tab_bar/about_movie.dart';
import 'package:movie_app/features/details/widgets/tab_bar/cast_grid_view.dart';
import 'package:movie_app/features/details/widgets/tab_bar/reviews_list_view.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColor.rateOrangeColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: AppStyles.stylePoppinsRegular14(),
            tabs:  const [
              Tab(text: 'About Movie'),
              Tab(text: 'Reviews'),
              Tab(text: 'Cast'),
            ],
          ),
          const Expanded(
            // Make sure TabBarView is inside Expanded
            child: TabBarView(
              children: [
                AboutMovie(),
                ReviewsListView(),
                CastGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
