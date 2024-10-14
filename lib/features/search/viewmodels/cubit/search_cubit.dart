import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/home/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> searchMovieByName(String keyword) async {
    // emit search loading state to show loading widget
    emit(SearchLoading());

    var res = await sl<NetworkService>().searchMovieByName(keyword: keyword);

    res.fold(
      (l) {
        // emit search failure state to show error message
        emit(SearchFailure(errorMessage: l.message));
      },
      (r) {
        // emit search success state to display found movies
        emit(SearchSuccess(movies: r));
      },
    );
  }
}
