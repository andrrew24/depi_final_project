part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingFailure extends TrendingState {
  final String errorMessage;

  TrendingFailure({required this.errorMessage});
}

final class TrendingSuccess extends TrendingState {
  final List<MoviesModel> moviesList;

  TrendingSuccess({required this.moviesList});
}
