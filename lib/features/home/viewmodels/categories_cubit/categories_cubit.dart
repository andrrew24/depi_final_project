import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/home/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getMoviesByCategory({required String endpoint}) async {
    emit(CategoriesLoading());

    var res =
        await sl<NetworkService>().getMoviesByCategory(endpoint: endpoint);

    res.fold(
      (l) {
        emit(CategoriesFailure(errorMessage: l.message));
      },
      (r) {
        emit(CategoriesSuccess(movies: r));
      },
    );
  }
}
