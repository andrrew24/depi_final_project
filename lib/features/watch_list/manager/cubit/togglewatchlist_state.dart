part of 'togglewatchlist_cubit.dart';

@immutable
sealed class TogglewatchlistState {}

final class TogglewatchlistInitial extends TogglewatchlistState {}

final class TogglewatchlistFailure extends TogglewatchlistState {
  final String errorMessage;

  TogglewatchlistFailure({required this.errorMessage});
}

final class TogglewatchlistSuccess extends TogglewatchlistState {}
