part of 'watchlist_cubit.dart';

@immutable
sealed class WatchlistState {}

final class WatchlistInitial extends WatchlistState {}

final class WatchlistLoading extends WatchlistState {}

final class WatchlistFailure extends WatchlistState {
  final String errorMessage;

  WatchlistFailure({required this.errorMessage});
}

final class WatchlistSuccess extends WatchlistState {
  final List<MovieDetailsModel> moviesList;

  WatchlistSuccess({required this.moviesList});
}
