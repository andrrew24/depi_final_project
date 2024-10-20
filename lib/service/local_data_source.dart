import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/config/constants/app_constants.dart';

class LocalDataSource {
  // box of watchlist movies
  var box = Hive.box(AppConstants.kWatchlistBox);

  void toggleWatchlist(int movieId) async {
    try {
      List<int> watchlist = box.get('movieIds', defaultValue: <int>[]);
      if (watchlist.contains(movieId)) {
        // Remove the movie if it exists
        watchlist.remove(movieId);
      } else {
        // Add the movie if it doesn't exist
        watchlist.add(movieId);
      }

      // Update the box with the new list
      box.put('movieIds', watchlist);
    } on Exception catch (e) {
      log("Error toggling movie from wathclist:$e");
      rethrow;
    }
  }

  void deleteMovieFromWatchList(int movieId) {
    try {
      List<int> watchlist = box.get('movieIds', defaultValue: <int>[]);

      if (watchlist.contains(movieId)) {
        // Remove the movie if it exists
        watchlist.remove(movieId);
      }

      // Update the box with the new list
      box.put('movieIds', watchlist);
    } catch (e) {
      log("Error deleting movie from wathclist:$e");
      rethrow;
    }
  }

  List<int> getWatchlistMoviesIds() {
    List<int> watchlistIds = box.get('movieIds', defaultValue: <int>[]);
    return watchlistIds;
  }

  bool isWatchListed(int movieId) {
    List<int> watchlist = box.get('movieIds', defaultValue: <int>[]);
    return watchlist.contains(movieId);
  }
}
