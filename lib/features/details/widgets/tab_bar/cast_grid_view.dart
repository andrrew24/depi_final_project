import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/constants/app_constants.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/viewmodels/cubit/cast_cubit.dart';

class CastGridView extends StatelessWidget {
  const CastGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CastFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is CastSuccess) {
          return SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: state.castList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 90,
                          width: 90,
                          imageUrl: state.castList[index].profilePath == null
                              ? AppConstants.kNoImgPreviewLink
                              : "${AppConstants.kStaticImgLink}${state.castList[index].profilePath}",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            state.castList[index].name ?? "No Actor Name",
                            style: AppStyles.stylePoppinsMedium12(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
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
