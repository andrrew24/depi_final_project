import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/config/errors/failure.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/features/home/models/movies_model.dart';

class NetworkService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey =
      dotenv.env['TMDB_API_KEY'] ?? ''; // Replace with your actual TMDB API key

  NetworkService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = {'api_key': _apiKey};
  }

  /// to get Movie Details By its id when user clicks on any movie item
  Future<MovieDetailsModel> getMovieDetailsById(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      return MovieDetailsModel.fromJson(response.data);
    } catch (error) {
      log('Error fetching movie by ID: $error');
      rethrow;
    }
  }

  /// to get list of trending movies that appears in the top of home screen
  Future<List<MoviesModel>> getTrendingMovies() async {
    try {
      final List<MoviesModel> movies = [];
      final incomingMovies = await _dio.get('/trending/movie/week');

      for (var movie in incomingMovies.data['results']) {
        movies.add(MoviesModel.fromJson(movie));
      }

      return movies;
    } catch (error) {
      log('Error fetching home TrendingMovies: $error');
      rethrow;
    }
  }

  /// to get List of upcoming, now playing , top rated and popular Categories with diff endpoint
  /// endpoints
  /// 1-  upcoming
  /// 2-  top_rated
  /// 3-  now_playing
  /// 4-  popular
  Future<List<MoviesModel>> getMoviesByCategory(
      {required String endpoint}) async {
    try {
      final List<MoviesModel> movies = [];

      final incomingMovies = await _dio.get('/movie/$endpoint');

      for (var movie in incomingMovies.data['results']) {
        movies.add(MoviesModel.fromJson(movie));
      }

      return movies;
    } catch (error) {
      log('Error fetching home MoviesByCategory: $error');
      rethrow;
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
        if (movie.backdropPath != null) {
          movies.add(movie);
        }
      }
      print(movies.first.backdropPath);

      return right(movies);
    } catch (error) {
      log('Error fetching search MovieByKeyword: $error');
      return left(ServerFailure(error.toString()));
    }
  }

  //  

  //TODO: Add get Movie's Review
}

// Dio Api Service
