import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'This movie explores the aftermath of Peter Parker’s identity being revealed as Spider-Man...',
        style: AppStyles.stylePoppinsRegular14(),
      ),
    );
  }
}
