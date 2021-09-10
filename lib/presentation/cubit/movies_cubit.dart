import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/movie.dart';
import '../../domain/usecases/movies_usecases.dart';

part 'movies_cubit.freezed.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  MoviesCubit({required MoviesUsecases moviesUsecases})
      : _moviesUsecases = moviesUsecases,
        super(MovieState()) {
    _getMovies(1);
  }

  final MoviesUsecases _moviesUsecases;

  void getMoviesNextPage() {
    if (!state.isLoading) _getMovies(state.page + 1);
  }

  void _getMovies(int page) {
    emit(state.copyWith(isLoading: true));
    _moviesUsecases.getMovies(page).listen(
          (Movies result) {
            emit(state.copyWith(
                page: result.page,
                movies: [...state.movies, ...result.movies]));
          },
          onError: (Object error) {},
          onDone: () {
            emit(state.copyWith(isLoading: false));
          },
        );
  }
}
