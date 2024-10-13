part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;

  MovieDetailsSuccess({required this.movieDetailsModel});
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure({required this.errorMessage});
}
