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
    getMovies();
  }

  final MoviesUsecases _moviesUsecases;

  void getMovies() {
    emit(state.copyWith(isLoading: true));
    _moviesUsecases.getMovies(state.page).listen(
          (Movies result) {
            emit(state.copyWith(page: result.page, movies: result.movies));
          },
          onError: (Object error) {},
          onDone: () {
            emit(state.copyWith(isLoading: false));
          },
        );
  }
}
