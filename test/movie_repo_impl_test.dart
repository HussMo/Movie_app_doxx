import 'package:cubit_movies/domain/repositories/movie_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:cubit_movies/data/data_sources/remote/repositories/movie_repo.dart';
import 'package:cubit_movies/shared/core/network/dio_manager.dart';
import 'package:cubit_movies/domain/request/movies_request.dart';
import 'package:cubit_movies/domain/request/movie_query_request.dart';

class MockDioManager extends Mock implements DioManager {
  @override
  Future<Response<dynamic>> get(String? path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? parameters}) async {
    if (path == 'discover/movie' && parameters != null) {
      final MoviesRequest moviesRequest = MoviesRequest.fromJson(parameters);
      return Response(data: {
        'results': [],
      }, requestOptions: RequestOptions(path: "path"));
    } else if (path == 'search/movie' && parameters != null) {
      final MoviesQueryRequest queryRequest =
          MoviesQueryRequest.fromJson(parameters);

      return Response(data: {
        'results': [],
      }, requestOptions: RequestOptions(path: "path"));
    } else if (path!.startsWith('movie/') && parameters != null) {
      final MovieDetailRequest detailRequest =
          MovieDetailRequest.fromJson(parameters);
      return Response(data: {}, requestOptions: RequestOptions(path: "path"));
    } else {
      throw DioError(requestOptions: RequestOptions(path: "path"));
    }
  }
}

class MovieDetailRequest {
  static MovieDetailRequest fromJson(Map<String, dynamic> parameters) {
    throw UnimplementedError();
  }
}

void main() {
  late MoviesRepository moviesRepository;
  late MockDioManager mockDio;

  setUp(() {
    mockDio = MockDioManager();
    moviesRepository = MoviesRepositoryImpl(mockDio);
  });

  test('getMovies returns empty list on error', () async {
    when(mockDio.get(anyNamed('path'), parameters: anyNamed('parameters')))
        .thenThrow(
            DioError(requestOptions: RequestOptions(path: 'discover/movie')));

    final result = await moviesRepository.getMovies(MoviesRequest());

    expect(result, isEmpty);
  });
}
