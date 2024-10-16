import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/home/widgets/category_tabbar_view.dart';
import 'package:movie_app/features/home/widgets/trending_movies_slider.dart';
import 'package:movie_app/utils/widgets/textfield_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "What do you want to watch?",
                style: AppStyles.stylePoppinsSemiBold18(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextfield(
                  textEditingController: TextEditingController()),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Trending Now",
                style: AppStyles.stylePoppinsSemiBold18(),
              ),
            ),
            Gap(10),
            Expanded(flex: 1, child: TrendingMoviesSlider()),
            const Expanded(
              flex: 2,
              child: CategoryTabBarView(),
            ),
          ],
        ),
      ),
    );
  }
}
