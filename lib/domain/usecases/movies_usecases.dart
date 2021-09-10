import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/models/movies_result.dart';

import '../models/genre.dart';
import '../models/settings.dart';
import '../repositories/genres_repository.dart';
import '../repositories/movies_repository.dart';
import '../repositories/settings_repository.dart';

abstract class MoviesUsecases {
  Stream<Movies> getMovies(int page);
}

class MoviesUsecasesImp implements MoviesUsecases {
  MoviesUsecasesImp(
      {required MoviesRepository moviesRepo,
      required SettingsRepository settingsRepo,
      required GenresRepository genresRepository})
      : this._moviesRepo = moviesRepo,
        this._genresRepository = genresRepository,
        this._settingsRepo = settingsRepo;

  final MoviesRepository _moviesRepo;
  final SettingsRepository _settingsRepo;
  final GenresRepository _genresRepository;

  @override
  Stream<Movies> getMovies(int page) async* {
    late List<Genre> genres;
    late Settings settings;

    yield* _settingsRepo.getSettings().asyncExpand((Settings event) async* {
      settings = event;
      yield* _genresRepository.getGenres();
    }).asyncExpand((List<Genre> event) async* {
      genres = event;
      yield* _moviesRepo.getMovies(page);
    }).map((MoviesResult result) => Movies(
          movies: result.results
              .map(
                (MovieResultItem item) => Movie(
                  adult: item.adult,
                  backdropPath: _buildBackdropPath(settings, item.backdropPath),
                  genres: getGenresFromIds(genres, item.genreIds),
                  id: item.id,
                  mediaType: item.mediaType,
                  originalLanguage: item.originalLanguage,
                  originalTitle: item.originalTitle,
                  overview: item.overview,
                  popularity: item.popularity,
                  posterPath: _buildPosterPath(settings, item.posterPath),
                  releaseDate: item.releaseDate,
                  title: item.title,
                  video: item.video,
                  voteAverage: item.voteAverage,
                  voteCount: item.voteCount,
                ),
              )
              .toList(),
          page: result.page,
          totalPages: result.totalPages,
        ));
  }

  String _buildBackdropPath(Settings settings, String path) {
    if (settings.images == null || settings.images!.backdropSizes.isEmpty)
      return '';
    return '${settings.images!.secureBaseUrl}${settings.images!.backdropSizes[1]}$path';
  }

  List<Genre> getGenresFromIds(List<Genre> all, List<int> ids) {
    List<Genre> genres = List.empty(growable: true);
    ids.forEach((int id) {
      Genre found = all.firstWhere((Genre element) => element.id == id,
          orElse: () => Genre(id: 0, name: ''));
      if (found.id > 0) genres.add(found);
    });
    return genres;
  }

  String _buildPosterPath(Settings settings, String path) {
    if (settings.images == null || settings.images!.posterSizes.isEmpty)
      return '';
    return '${settings.images!.secureBaseUrl}${settings.images!.posterSizes[2]}$path';
  }
}
