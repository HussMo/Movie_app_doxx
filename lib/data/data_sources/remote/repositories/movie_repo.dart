import '../../../../domain/request/filter_request.dart';
import '../../../../domain/request/movie_deatiul_requesy.dart';
import '../../../../domain/request/movie_query_request.dart';
import '../../../../domain/request/movies_request.dart';
import '../../../../domain/response/movie_response.dart';
import '../../../../domain/response/movies_response.dart';

abstract class MoviesRepository {
  Future<List<MoviesResponse>> getMovies(final MoviesRequest parameters);

  Future<List<MoviesResponse>> getMoviesByQuery(
      final MoviesQueryRequest parameters);

  Future<List<MoviesResponse>> getMoviesByFilter(final FilterRequest filter);

  Future<MovieResponse?> getMovie(final MovieRequest parameters);
}
