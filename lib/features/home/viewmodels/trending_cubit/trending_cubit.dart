import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/home/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());

  Future<void> getTrendingMovies() async {
    emit(TrendingLoading());

    var res = await sl<NetworkService>().getTrendingMovies();

    res.fold(
      (l) {
        emit(TrendingFailure(errorMessage: l.message));
      },
      (r) {
        emit(TrendingSuccess(moviesList: r));
      },
    );
  }
}
