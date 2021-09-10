import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
class SettingsDto {
  SettingsDto({this.changeKeys, this.images});

  SettingsImagesDto? images;

  factory SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);

  @JsonKey(name: 'change_keys')
  List<String>? changeKeys;
}

@JsonSerializable()
class SettingsImagesDto {
  SettingsImagesDto({
    this.baseUrl,
    this.backdropSizes,
    this.logoSizes,
    this.posterSizes,
    this.profileSizes,
    this.secureBaseUrl,
    this.stillSizes,
  });

  factory SettingsImagesDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsImagesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsImagesDtoToJson(this);

  @JsonKey(name: 'base_url')
  String? baseUrl;

  @JsonKey(name: 'secure_base_url')
  String? secureBaseUrl;

  @JsonKey(name: 'backdrop_sizes')
  List<String>? backdropSizes;

  @JsonKey(name: 'logo_sizes')
  List<String>? logoSizes;

  @JsonKey(name: 'poster_sizes')
  List<String>? posterSizes;

  @JsonKey(name: 'profile_sizes')
  List<String>? profileSizes;

  @JsonKey(name: 'still_sizes')
  List<String>? stillSizes;
}
