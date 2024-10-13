import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/viewmodels/review_cubit/review_cubit.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ReviewFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is ReviewSuccess) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.reviewsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  leading: ClipOval(
                    child: CachedNetworkImage(
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                        imageUrl:
                            "${AppConstants.kStaticImgLink}${state.reviewsList[index].authorDetails!.avatarPath}"),
                  ),
                  title: Text(
                    state.reviewsList[index].authorDetails!.name ??
                        "No Author Name",
                    style: AppStyles.stylePoppinsMedium12(),
                  ),
                  subtitle: Text(
                      state.reviewsList[index].content ?? "No Content",
                      style: AppStyles.stylePoppinsRegular12()),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
