import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_dto.g.dart';

@JsonSerializable()
class GenresDto {
  GenresDto({this.genres});

  factory GenresDto.fromJson(Map<String, dynamic> json) =>
      _$GenresDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GenresDtoToJson(this);

  List<GenreDto>? genres;
}

@JsonSerializable()
class GenreDto {
  GenreDto({this.id, this.name});

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);

  int? id;
  String? name;
}
