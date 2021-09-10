import '../models/genre.dart';

abstract class GenresRepository {
  Stream<List<Genre>> getGenres();
}
