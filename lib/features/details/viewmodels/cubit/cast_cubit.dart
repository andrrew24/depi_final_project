import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/details/models/cast_model/cast_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> getMovieCast(int movieID) async {
    emit(CastLoading());

    var res = await sl<NetworkService>().getMovieCast(movieID);

    res.fold(
      (l) {
        emit(CastFailure(errorMessage: l.message));
      },
      (r) {
        emit(CastSuccess(castList: r));
      },
    );
  }
}
