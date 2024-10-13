part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastFailure extends CastState {
  final String errorMessage;

  CastFailure({required this.errorMessage});
}

final class CastSuccess extends CastState {
  final List<CastModel> castList;

  CastSuccess({required this.castList});
}
