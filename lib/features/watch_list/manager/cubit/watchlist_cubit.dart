import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/service/local_data_source.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitial());

  Future<void> getAllWatchlistMovies() async {
    emit(WatchlistLoading());

    var res = await sl<NetworkService>().getAllWatchlistMovies();

    res.fold(
      (l) {
        emit(WatchlistFailure(errorMessage: l.message));
      },
      (r) {
        emit(WatchlistSuccess(moviesList: r));
      },
    );
  }

  void deleteMovieFromWatchList(int movieId) {
    sl<LocalDataSource>().deleteMovieFromWatchList(movieId);
    getAllWatchlistMovies();
    
  }
}
