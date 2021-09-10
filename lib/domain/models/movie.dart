import 'genre.dart';

class Movies {
  Movies({
    required this.movies,
    required this.page,
    required this.totalPages,
  });

  final List<Movie> movies;
  final int page;
  final int totalPages;
}

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool video;
  double voteAverage;
  String overview;
  String releaseDate;
  int voteCount;
  bool adult;
  String backdropPath;
  int id;
  List<Genre> genres;
  String title;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  double popularity;
  String mediaType;
}
