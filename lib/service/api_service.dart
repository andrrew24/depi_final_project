import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/features/details/models/movie_details_model/movie_details_model.dart';
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

  /// to get Movie By its id when user clicks on any movie item
  Future<MovieDetailsModel> getMovieById(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final movie = MovieDetailsModel.fromJson(response.data);
      return movie;
    } catch (error) {
      print('Error fetching movie by ID: $error');
      rethrow;
    }
  }

  /// to get trending movies that appears in the top of home screen
  Future<TrendingMoviesResponseDto> getTrendingMovies() async {
    try {
      final response = await _dio.get('/trending/movie/week');
      return response.data;
    } catch (error) {
      print('Error fetching trending movies: $error');
      rethrow;
    }
  }
}
// Dio Api Service
