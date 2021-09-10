
import 'package:dio/dio.dart';

import '../data/models/genres_dto.dart';
import '../data/sources/genres_source.dart';

class GenreRemoteSource implements GenresSource {
  @override
  Stream<List<GenreDto>> getGenres() async* {
    Dio dio = Dio();
    yield* dio
        .get(
            'https://api.themoviedb.org/3/genre/movie/list?api_key=85a1531dc13f075d3be50c051fe926d6&language=es-ES')
        .asStream()
        .map((Response response) {
      if (response.statusCode == 200) {
        return GenresDto.fromJson(response.data).genres ?? [];
      }
      throw UnimplementedError();
    });
  }

  @override
  Stream<List<GenreDto>> saveGenres(List<GenreDto> genres) {
    throw UnimplementedError();
  }
}
