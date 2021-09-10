import '../models/movies_dto.dart';

abstract class MoviesSource {
  Stream<MoviesResultDto> getMovies(int page);
}
