import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/app_styles.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/img/userReviewimage.png'),
            ),
            title: Text(
              'seif',
              style: AppStyles.stylePoppinsRegular15(),
            ),
            subtitle: Text('Amazing movie, great action and storytelling!',
                style: AppStyles.stylePoppinsRegular14()),
          );
        },
      ),
    );
  }
}
