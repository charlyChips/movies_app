import '../models/movies_result.dart';

abstract class MoviesRepository {
  Stream<MoviesResult> getMovies(int page);
}
