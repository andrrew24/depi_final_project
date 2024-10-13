
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
  Future<void> getMovieDetailsById(int movieID) async {
    emit(MovieDetailsLoading());

    var res = await sl<NetworkService>().getMovieDetailsById(movieID);

    res.fold(
      (l) {
        emit(
          MovieDetailsFailure(errorMessage: l.message),
        );
      },
      (r) {
        emit(
          MovieDetailsSuccess(movieDetailsModel: r),
        );
      },
    );
  }
}
