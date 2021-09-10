import '../models/genres_dto.dart';

abstract class GenresSource {
  Stream<List<GenreDto>> getGenres();
  Stream<List<GenreDto>> saveGenres(List<GenreDto> genres);
}
