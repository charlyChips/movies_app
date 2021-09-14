import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/usecases/movies_usecases.dart';
import 'package:movies_app/presentation/cubit/movies_cubit.dart';
import 'package:movies_app/presentation/pages/movies_list_page.dart';
import '../../stubs.dart';
import 'movies_page_test.mocks.dart';

class MoviesUseCase extends Mock implements MoviesUsecases {}

@GenerateMocks([MoviesUseCase])
void main() {
  late MockMoviesUseCase _useCases;
  final movies = Stubs.movies;
  group('Movies List Page', () {
    setUp(() {
      _useCases = MockMoviesUseCase();
    });

    Widget _buildProvider() {
      when(_useCases.getMovies(1)).thenAnswer(
          (_) => Stream.value(Movies(movies: movies, page: 1, totalPages: 1)));

      return MaterialApp(
        home: Scaffold(
          body: BlocProvider<MoviesCubit>(
            create: (_) => MoviesCubit(moviesUsecases: _useCases),
            child: MoviesListPage(),
          ),
        ),
      );
    }

    testWidgets('Initial', (WidgetTester tester) async {
      await tester.pumpWidget(_buildProvider());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      verify(_useCases.getMovies(1)).called(1);
      await tester.pump();

      movies.forEach((Movie movie) {
        expect(find.text(movie.title), findsOneWidget);
        expect(find.text('Fecha de lanzamiento: ${movie.releaseDate}'),
            findsOneWidget);
        expect(find.byKey(ValueKey<String>('iconButton${movie.id}')),
            findsOneWidget);
      });
    });

    testWidgets('Go To Detail', (WidgetTester tester) async {
      await tester.pumpWidget(_buildProvider());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      verify(_useCases.getMovies(1)).called(1);
      await tester.pump();

      final Movie movie = movies[0];

      expect(find.byKey(ValueKey<String>('iconButton${movie.id}')),
          findsOneWidget);

      //Going to detail
      await tester.tap(find.byKey(ValueKey<String>('iconButton${movie.id}')));
      await tester.pumpAndSettle();

      //Expectation on MovieDetailPage
      expect(find.text(movie.title), findsOneWidget);
      expect(find.text('(${movie.originalTitle})'), findsOneWidget);
      expect(find.text('Lanzamiento: ${movie.releaseDate}'), findsOneWidget);
      expect(find.text(movie.overview), findsOneWidget);
      expect(find.text(movie.voteAverage.toStringAsFixed(2)), findsOneWidget);
    });
  });
}
