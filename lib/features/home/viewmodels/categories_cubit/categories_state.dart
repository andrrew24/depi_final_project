part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  CategoriesFailure({required this.errorMessage});
}

final class CategoriesSuccess extends CategoriesState {
  final List<MoviesModel> movies;

  CategoriesSuccess({required this.movies});
}
