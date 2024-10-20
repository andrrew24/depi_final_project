import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/service/local_data_source.dart';

part 'togglewatchlist_state.dart';

class TogglewatchlistCubit extends Cubit<TogglewatchlistState> {
  TogglewatchlistCubit() : super(TogglewatchlistInitial());

  void toggleWatchlist(int movieId) {
    try {
      sl<LocalDataSource>().toggleWatchlist(movieId);
      emit(
        TogglewatchlistSuccess(),
      );
    } catch (e) {
      emit(TogglewatchlistFailure(errorMessage: e.toString()));
    }
  }
}
