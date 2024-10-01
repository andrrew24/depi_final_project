import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/config/constants/assets.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';
import 'package:movie_app/utils/widgets/movie_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hasBG: false,
        title: Text(
          "Home",
          style: AppStyles.styleMontserratRegular16(),
        ),
        trailingIcon: Icons.info_outline_rounded,
      ),
      body: Center(
        child: Text("HomeView"),
      ),
    );
  }
}
