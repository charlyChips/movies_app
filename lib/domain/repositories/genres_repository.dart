import 'package:movies_app/domain/models/genre.dart';

abstract class GenresRepository {
  Stream<List<Genre>> getGenres();
}
