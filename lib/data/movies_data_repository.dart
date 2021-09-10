import '../domain/models/movies_result.dart';
import '../domain/repositories/movies_repository.dart';
import 'models/movies_dto.dart';
import 'sources/movies_source.dart';

class MoviesDataRepository extends MoviesRepository {
  MoviesDataRepository(this.remoteSource);

  final MoviesSource remoteSource;

  @override
  Stream<MoviesResult> getMovies(int page) async* {
    yield* remoteSource.getMovies(page).map((MoviesResultDto dto) =>
        MoviesResult(
            page: dto.page ?? 1,
            results: List<MovieResultItem>.from(
                (dto.results ?? []).map((MovieDto dtoItem) => MovieResultItem(
                      adult: dtoItem.adult ?? false,
                      backdropPath: dtoItem.backdropPath ?? '',
                      genreIds: dtoItem.genreIds ?? [],
                      id: dtoItem.id ?? 0,
                      mediaType: dtoItem.mediaType ?? '',
                      originalLanguage: dtoItem.originalLanguage ?? '',
                      originalTitle: dtoItem.originalTitle ?? '',
                      overview: dtoItem.overview ?? '',
                      popularity: dtoItem.popularity ?? 0.0,
                      posterPath: dtoItem.posterPath ?? '',
                      releaseDate: dtoItem.releaseDate ?? '',
                      title: dtoItem.title ?? '',
                      video: dtoItem.video ?? false,
                      voteAverage: dtoItem.voteAverage ?? 0.0,
                      voteCount: dtoItem.voteCount ?? 0,
                    ))),
            totalPages: dto.totalPages ?? 0,
            totalResults: dto.totalResults ?? 0));
  }
}
