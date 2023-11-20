
import 'dart:developer';
import '../../data/data_sources/remote/repositories/filter_repo.dart';
import '../../shared/constant/app_value.dart';
import '../../shared/core/network/dio_manager.dart';
import '../../shared/utils/utils.dart';
import '../response/genre_response.dart';

class FilterRepositoryImpl extends FilterRepository {
  final DioManager _dio;
  FilterRepositoryImpl(this._dio);

  @override
  Future<List<GenreResponse>> getGenres() async {
    List<GenreResponse> res = <GenreResponse>[];
    try {
      return await _dio.get(
        'genre/movie/list',
        parameters: {
          'api_key': AppValues.apiKey,
          'language': getLangCode(),
        },
      ).then((response) {
        res = (response.data['genres'] as List).map((e) {
          return GenreResponse.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      log(e.toString());
      return res;
    }
  }
}
