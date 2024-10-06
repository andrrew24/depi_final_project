import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/widgets/details_widget.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hasBG: false,
        title: Text(
          'Details',
          style: AppStyles.styleMontserratSemiBold16(),
        ),
        trailingIcon: FontAwesomeIcons.solidBookmark,
      ),
      body: const DetailsWidget(),
    );
  }
}
