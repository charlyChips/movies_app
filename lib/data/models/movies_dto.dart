import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_dto.g.dart';

@JsonSerializable()
class MoviesResultDto {
  MoviesResultDto(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory MoviesResultDto.fromJson(Map<String, dynamic> json) =>
      _$MoviesResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResultDtoToJson(this);

  int? page;
  List<MovieDto>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;
}

@JsonSerializable()
class MovieDto {
  MovieDto({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  int? id;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  double? popularity;

  @JsonKey(name: 'media_type')
  String? mediaType;
}
