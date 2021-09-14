import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/domain/managers/date_manager.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/models/movies_result.dart';
import 'package:movies_app/domain/repositories/genres_repository.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/repositories/settings_repository.dart';
import 'package:movies_app/domain/usecases/movies_usecases.dart';

import '../../stubs.dart';
import 'movies_usecases_test.mocks.dart';

class MoviesRepo extends Mock implements MoviesRepository {}

class SettingsRepo extends Mock implements SettingsRepository {}

class GenresRepo extends Mock implements GenresRepository {}

class DateManagerMock extends Mock implements DateManager {}

@GenerateMocks([MoviesRepo, SettingsRepo, GenresRepo, DateManagerMock])
void main() {
  late MockMoviesRepo _moviesRepo;
  late MockSettingsRepo _settingsRepo;
  late MockGenresRepo _genresRepo;
  late MockDateManagerMock _dateManager;

  setUp(() {
    _moviesRepo = MockMoviesRepo();
    _settingsRepo = MockSettingsRepo();
    _genresRepo = MockGenresRepo();
    _dateManager = MockDateManagerMock();
  });

  MoviesUsecases _getUseCases() => MoviesUsecasesImp(
        moviesRepo: _moviesRepo,
        settingsRepo: _settingsRepo,
        genresRepository: _genresRepo,
        dateManager: _dateManager,
      );

  group('MoviesUseCases', () {
    test('Get Movies Successfully', () {
      when(_settingsRepo.getSettings())
          .thenAnswer((_) => Stream.value(Stubs.settings));
      when(_genresRepo.getGenres())
          .thenAnswer((_) => Stream.value(Stubs.genres));
      when(_moviesRepo.getMovies(any)).thenAnswer((_) => Stream.value(
          MoviesResult(
              results: Stubs.moviesItems,
              page: 1,
              totalPages: 100,
              totalResults: 1000)));

      when(_dateManager.reformatDateString(any, any, any))
          .thenReturn(Stubs.releaseDateFormatted);

      final useCases = _getUseCases();

      final imageSettings = Stubs.settings.images!;
      expect(
        useCases.getMovies(1),
        emits(isA<Movies>()
            .having(
                (Movies movies) => movies.movies.length, 'Length', equals(3))
            .having(
                (Movies movies) => movies.movies[0].backdropPath,
                'Backdrop Path',
                equals(
                    '${imageSettings.secureBaseUrl}${imageSettings.backdropSizes[1]}${Stubs.moviesItems[0].backdropPath}'))
            .having(
                (Movies movies) => movies.movies[0].posterPath,
                'Poster Path',
                equals(
                    '${imageSettings.secureBaseUrl}${imageSettings.posterSizes[2]}${Stubs.moviesItems[0].posterPath}'))
            .having((Movies movies) => movies.movies[0].releaseDate,
                'Release date', Stubs.releaseDateFormatted)),
      );
    });
  });
}
