import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyles.stylePoppinsRegular14(),
      ),
    );
  }
}
