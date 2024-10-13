import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/service_locator/service_locator.dart';
import 'package:movie_app/features/details/models/review_model/review_model.dart';
import 'package:movie_app/service/api_service.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> getMovieReviews(int movieID) async {
    emit(ReviewLoading());
    var res = await sl<NetworkService>().getMovieReviews(movieID);

    res.fold(
      (error) {
        emit(ReviewFailure(errorMessage: error.message));
      },
      (reviewList) {
        emit(ReviewSuccess(reviewsList: reviewList));
      },
    );
  }
}
