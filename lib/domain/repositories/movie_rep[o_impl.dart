import 'dart:developer';
import '../../data/data_sources/remote/repositories/movie_repo.dart';
import '../../shared/core/network/dio_manager.dart';
import '../request/filter_request.dart';
import '../request/movie_deatiul_requesy.dart';
import '../request/movie_query_request.dart';
import '../request/movies_request.dart';
import '../response/movie_response.dart';
import '../response/movies_response.dart';


class MoviesRepositoryImpl extends MoviesRepository {
  final DioManager _dio;
  MoviesRepositoryImpl(this._dio);

  @override
  Future<List<MoviesResponse>> getMovies(final MoviesRequest parameters) async {
    List<MoviesResponse> res = <MoviesResponse>[];
    try {
      return await _dio.get(
        'discover/movie',
        parameters: parameters.toJson(),
      ).then((response) {
        res = (response.data['results'] as List).map((e) {
          return MoviesResponse.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      log(e.toString());
      return res;
    }
  }

  @override
  Future<List<MoviesResponse>> getMoviesByQuery(final MoviesQueryRequest parameters) async {
    List<MoviesResponse> res = <MoviesResponse>[];
    try {
      return await _dio.get(
        'search/movie',
        parameters: parameters.toJson(),
      ).then((response) {
        res = (response.data['results'] as List).map((e) {
          return MoviesResponse.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      log(e.toString());
      return res;
    }
  }

  @override
  Future<List<MoviesResponse>> getMoviesByFilter(final FilterRequest filter) async {
    List<MoviesResponse> res = <MoviesResponse>[];
    try {
      return await _dio.get(
        'discover/movie',
        parameters: filter.toJson(),
      ).then((response) {
        res = (response.data['results'] as List).map((e) {
          return MoviesResponse.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      log(e.toString());
      return res;
    }
  }

  @override
  Future<MovieResponse?> getMovie(final MovieRequest parameters) async {
    try {
      return await _dio.get(
        'movie/${parameters.movieId}',
        parameters: parameters.toJson(),
      ).then((response) {
        return MovieResponse.fromJson(response.data);
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
