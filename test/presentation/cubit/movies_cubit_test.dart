import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/usecases/movies_usecases.dart';
import 'package:movies_app/presentation/cubit/movies_cubit.dart';
import '../../stubs.dart';
import 'movies_cubit_test.mocks.dart';

class MoviesUseCasesMock extends Mock implements MoviesUsecases {}

@GenerateMocks([MoviesUseCasesMock])
void main() {
  late MockMoviesUseCasesMock _usecases;

  group('Movies Cubit', () {
    setUp(() {
      _usecases = MockMoviesUseCasesMock();
    });

    blocTest<MoviesCubit, MovieState>(
      'Initial',
      build: () {
        when(_usecases.getMovies(1)).thenAnswer((_) => Stream<Movies>.value(
            Movies(movies: Stubs.movies, page: 1, totalPages: 100)));
        return MoviesCubit(moviesUsecases: _usecases);
      },
      verify: (MoviesCubit bloc) {
        verify(_usecases.getMovies(1)).called(1);
        expect(bloc.state.movies.length, equals(3));
      },
    );

    blocTest<MoviesCubit, MovieState>('Get Next Page',
        build: () {
          when(_usecases.getMovies(1)).thenAnswer((_) => Stream<Movies>.value(
              Movies(movies: Stubs.movies, page: 1, totalPages: 100)));
          when(_usecases.getMovies(2)).thenAnswer((_) => Stream<Movies>.value(
              Movies(movies: Stubs.movies, page: 2, totalPages: 100)));

          return MoviesCubit(moviesUsecases: _usecases);
        },
        seed: () => MovieState(isLoading: false, totalPages: 100),
        act: (MoviesCubit cubit) => cubit.getMoviesNextPage(),
        verify: (MoviesCubit cubit) {
          verify(_usecases.getMovies(2)).called(1);
          expect(cubit.state.movies.length, equals(6));
          expect(cubit.state.page, equals(2));
        });
  });
}
