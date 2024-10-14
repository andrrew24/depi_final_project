import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key, required this.about});

  final String about;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        about,
        style: AppStyles.stylePoppinsRegular14(),
      ),
    );
  }
}
