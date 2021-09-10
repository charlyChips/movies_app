import '../data/models/genres_dto.dart';
import '../data/sources/genres_source.dart';

class GenresCacheSource implements GenresSource {
  List<GenreDto> _genres = <GenreDto>[];

  @override
  Stream<List<GenreDto>> getGenres() async* {
    yield _genres;
  }

  @override
  Stream<List<GenreDto>> saveGenres(List<GenreDto> genres) async* {
    _genres = genres;
    yield _genres;
  }
}
