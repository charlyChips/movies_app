import '../domain/models/genre.dart';
import '../domain/repositories/genres_repository.dart';
import 'models/genres_dto.dart';
import 'sources/genres_source.dart';

class GenresDataRepository implements GenresRepository {
  GenresDataRepository({required this.remoteSource, required this.cacheSource});

  final GenresSource remoteSource;
  final GenresSource cacheSource;

  @override
  Stream<List<Genre>> getGenres() async* {
    yield* cacheSource
        .getGenres()
        .asyncExpand((List<GenreDto> cachedGenres) async* {
      if (cachedGenres.isEmpty)
        yield* _downloadGenres();
      else
        yield cachedGenres;
    }).map((List<GenreDto> dtos) {
      return List<Genre>.from(dtos
          .map((GenreDto dto) => Genre(id: dto.id ?? 0, name: dto.name ?? '')));
    });
  }

  Stream<List<GenreDto>> _downloadGenres() async* {
    yield* remoteSource.getGenres().asyncExpand((List<GenreDto> remoteGenres) {
      return cacheSource.saveGenres(remoteGenres);
    });
  }
}
