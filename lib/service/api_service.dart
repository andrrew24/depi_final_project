import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/config/errors/failure.dart';
import 'package:movie_app/features/details/models/cast_model/cast_model.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/features/details/models/review_model/review_model.dart';
import 'package:movie_app/features/home/models/movies_model.dart';

class NetworkService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey =
      dotenv.env['TMDB_API_KEY'] ?? ''; // Replace with your actual TMDB API key

  NetworkService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = {'api_key': _apiKey};
  }

  /// to get list of trending movies that appears in the top of home screen
  Future<Either<ServerFailure, List<MoviesModel>>> getTrendingMovies() async {
    try {
      final List<MoviesModel> movies = [];
      final incomingMovies = await _dio.get('/trending/movie/week');

      for (var movie in incomingMovies.data['results']) {
        movies.add(MoviesModel.fromJson(movie));
      }

      return right(movies);
    } catch (error) {
      log('Error fetching home TrendingMovies: $error');
      return left(ServerFailure(error.toString()));
    }
  }

  /// to get List of upcoming, now playing , top rated and popular Categories with diff endpoint
  /// endpoints
  /// 1-  upcoming
  /// 2-  top_rated
  /// 3-  now_playing
  /// 4-  popular
  Future<Either<ServerFailure, List<MoviesModel>>> getMoviesByCategory(
      {required String endpoint}) async {
    try {
      final List<MoviesModel> movies = [];

      final incomingMovies = await _dio.get('/movie/$endpoint');

      for (var movie in incomingMovies.data['results']) {
        movies.add(MoviesModel.fromJson(movie));
      }

      return right(movies);
    } catch (error) {
      log('Error fetching home MoviesByCategory: $error');
      return left(ServerFailure(error.toString()));
    }
  }

  /// to Search List of Movies with a keyword
  Future<Either<ServerFailure, List<MoviesModel>>> searchMovieByName(
      {required String keyword}) async {
    try {
      final List<MoviesModel> movies = [];

      final incomingMovies = await _dio.get(
        '/search/movie',
        queryParameters: {
          'query': keyword,
        },
      );

      for (var item in incomingMovies.data['results']) {
        final movie = MoviesModel.fromJson(item);
        if (movie.genreIds!.isNotEmpty) {
          movie.genre = await getGenreName(movie.genreIds![0]);
        }
        if (movie.backdropPath != null) {
          movies.add(movie);
        }
      }
      return right(movies);
    } catch (error) {
      log('Error fetching search MovieByName: $error');
      return left(ServerFailure(error.toString()));
    }
  }

  /// to get Movie Details By its id when user clicks on any movie item
  Future<Either<ServerFailure, MovieDetailsModel>> getMovieDetailsById(
      int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final movieDetails = MovieDetailsModel.fromJson(response.data);

      return right(movieDetails);
    } catch (error) {
      log('Error fetching movie by ID: $error');
      return left(ServerFailure(error.toString()));
    }
  }

  //to Get Movie's Cast
  Future<Either<ServerFailure, List<CastModel>>> getMovieCast(
      int movieID) async {
    try {
      final List<CastModel> castList = [];

      final incomingCast = await _dio.get("/movie/$movieID/credits");

      for (var item in incomingCast.data['cast']) {
        final cast = CastModel.fromJson(item);
        castList.add(cast);
      }

      return right(castList);
    } catch (error) {
      log('Error fetching Movie Cast : $error');
      return left(ServerFailure(error.toString()));
    }
  }

  //to Get Movie's Reviews
  Future<Either<ServerFailure, List<ReviewModel>>> getMovieReviews(
      int movieID) async {
    try {
      final List<ReviewModel> reviewsList = [];

      final incomingReviews = await _dio.get("/movie/$movieID/reviews");

      for (var item in incomingReviews.data['results']) {
        final review = ReviewModel.fromJson(item);
        if (review.authorDetails!.avatarPath != null) {
          reviewsList.add(review);
        }
      }

      return right(reviewsList);
    } catch (error) {
      log('Error fetching Movie Reviews : $error');
      return left(ServerFailure(error.toString()));
    }
  }

  Future<String> getGenreName(int genreId) async {
    var genres = await _dio.get("genre/movie/list");
    for (var genre in genres.data['genres']) {
      if (genre['id'] == genreId) {
        return genre['name'] as String;
      }
    }
    return 'Genre not found';
  }
}

// Dio Api Service
