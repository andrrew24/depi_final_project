import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class CastGridView extends StatelessWidget {
  const CastGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/img/defaultactorimage.png', // Replace with cast image
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Tom Holland', style: AppStyles.stylePoppinsMedium12()),
              ],
            ),
          );
        },
      ),
    );
  }
}
