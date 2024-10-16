import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/config/theme/app_styles.dart';
import 'package:movie_app/features/details/views/details_view.dart';
import 'package:movie_app/features/search/viewmodels/cubit/search_cubit.dart';
import 'package:movie_app/features/search/widgets/search_initial_widget.dart';
import 'package:movie_app/features/search/widgets/search_no_result_widget.dart';
import 'package:movie_app/utils/widgets/basic_app_bar.dart';
import 'package:movie_app/utils/widgets/movie_item.dart';
import 'package:movie_app/utils/widgets/textfield_custom.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          trailingIcon: Icons.info_outline_rounded,
          hasBG: false,
          title: Text(
            "Search",
            style: AppStyles.styleMontserratRegular16(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextfield(
                textEditingController: TextEditingController(),
                onSubmit: (value) {
                  BlocProvider.of<SearchCubit>(context)
                      .searchMovieByName(value);
                },
              ),
            ),
            const Gap(5),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    if (state.movies.isNotEmpty) {
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        itemCount: state.movies.length,
                        separatorBuilder: (context, index) => const Gap(10),
                        itemBuilder: (context, index) {
                          return MovieItem(
                            moviesModel: state.movies[index],
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsView(
                                      movieID: state.movies[index].id!);
                                },
                              ));
                            },
                          );
                        },
                      );
                    } else {
                      return const SearchNoResultWidget();
                    }
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchFailure) {
                    return const SearchNoResultWidget();
                  } else if (state is SearchInitial) {
                    return const SearchInitialWidget();
                  }
                  return Container();
                },
              ),
            )
          ],
        ));
  }
}
