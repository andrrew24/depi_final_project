import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/viewmodels/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home/widgets/simple_movie_item.dart';

class CategoryMoviesGridView extends StatefulWidget {
  const CategoryMoviesGridView({
    super.key,
    required this.endpoint,
  });

  final String endpoint;

  @override
  State<CategoryMoviesGridView> createState() => _CategoryMoviesGridViewState();
}

class _CategoryMoviesGridViewState extends State<CategoryMoviesGridView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context)
        .getMoviesByCategory(endpoint: widget.endpoint);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is CategoriesSuccess) {
          return GridView.builder(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
            itemCount: state.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 4,
              crossAxisCount: 3,
              mainAxisSpacing: 18,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return SimpleMovieItem(
                model: state.movies[index],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
