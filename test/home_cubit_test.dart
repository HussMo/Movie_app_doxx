import 'package:cubit_movies/domain/request/filter_request.dart';
import 'package:cubit_movies/domain/request/movie_deatiul_requesy.dart';
import 'package:cubit_movies/domain/request/movie_query_request.dart';
import 'package:cubit_movies/domain/response/movie_response.dart';
import 'package:cubit_movies/shared/core/base/pageintation_scroll_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cubit_movies/presentation/ui/home/home_cubit.dart';
import 'package:cubit_movies/data/data_sources/remote/repositories/movie_repo.dart';
import 'package:cubit_movies/domain/response/movies_response.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends MoviesRepository {
  @override
  Future<List<MoviesResponse>> getMovies(dynamic data) async {
    return [];
  }

  @override
  Future<MovieResponse?> getMovie(MovieRequest parameters) {
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesResponse>> getMoviesByFilter(FilterRequest filter) {
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesResponse>> getMoviesByQuery(MoviesQueryRequest parameters) {
    throw UnimplementedError();
  }
}

void main() {
  late HomeCubit homeCubit;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    homeCubit = HomeCubit(mockRepository);
  });

  tearDown(() {
    homeCubit.close();
  });

  test('Initial state is HomeEmptyState', () {
    expect(homeCubit.state, HomeEmptyState());
  });

  test('getAllMovies updates state correctly', () async {
    when(mockRepository.getMovies(any)).thenAnswer((_) async => []);

    homeCubit.getAllMovies();

    expect(
        homeCubit.state,
        emitsInOrder([
          HomeLoadingState(),
          HomeLoadedState(
            movies: const [],
            moviesSC: PaginationScrollController(pagination()),
            filterModel: null,
            paginationLoader: false,
          )
        ]));
  });

  test('searchMovies updates state correctly', () async {
    when(mockRepository.getMoviesByQuery(any as MoviesQueryRequest))
        .thenAnswer((_) async => []);

    homeCubit.searchMovies('query');

    expect(
        homeCubit.state,
        emitsInOrder([
          HomeMoviesLoadingState(),
          HomeLoadedState(
            movies: const [],
            moviesSC: PaginationScrollController(pagination()),
            filterModel: null,
            paginationLoader: false,
          )
        ]));
  });
}

Function pagination() {
  return () {};
}

mixin any {}
