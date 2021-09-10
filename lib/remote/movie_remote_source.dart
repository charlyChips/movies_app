import 'package:dio/dio.dart';

import '../data/models/movies_dto.dart';
import '../data/sources/movies_source.dart';

class MovieRemoteSource implements MoviesSource {
  @override
  Stream<MoviesResultDto> getMovies(int page) async* {
    Dio dio = Dio();
    yield* dio
        .get(
            'https://api.themoviedb.org/3/trending/movie/day?page=$page&api_key=85a1531dc13f075d3be50c051fe926d6&language=es-ES')
        .asStream()
        .map((Response response) {
      if (response.statusCode == 200) {
        return MoviesResultDto.fromJson(response.data);
      } else
        throw UnimplementedError();
    });
  }
}
