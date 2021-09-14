part of 'movies_cubit.dart';

@freezed
abstract class MovieState with _$MovieState {
  factory MovieState({
    @Default(<Movie>[]) List<Movie> movies,
    @Default(false) bool isLoading,
    @Default(1) int page,
    @Default(1) int totalPages,
  }) = _MovieState;
}
