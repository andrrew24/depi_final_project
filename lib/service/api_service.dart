import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
import 'package:movie_app/features/home/models/movies_model.dart';
import 'package:movie_app/service/DTOs/MovieDetailsResponseDTO.dart';
import 'package:movie_app/service/DTOs/TrendingMoviesResponseDTO.dart';

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
      print('Error fetching movie by ID: $error');
      rethrow;
    }
  }

  /// to get list of trending movies that appears in the top of home screen
  Future<List<MoviesModel>> getTrendingMovies() async {
    try {
      final List<MoviesModel> movies = [];
      final incomingMovies = await _dio.get('/trending/movie/week');

      for (var movie in incomingMovies.data) {
        movies.add(MoviesModel.fromJson(movie));
      }

      return movies;
    } catch (error) {
      print('Error fetching home movies: $error');
      rethrow;
    }
  }
}

// Dio Api Service
