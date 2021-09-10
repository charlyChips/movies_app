import 'package:dio/dio.dart';

import '../data/models/settings_dto.dart';
import '../data/sources/settings_source.dart';

class SettingsRemoteSource implements SettingsSource {
  @override
  Stream<SettingsDto> getSettings() async* {
    Dio dio = new Dio();
    yield* dio
        .get(
            'https://api.themoviedb.org/3/configuration?api_key=85a1531dc13f075d3be50c051fe926d6')
        .asStream()
        .map((Response response) {
      if (response.statusCode == 200) {
        return SettingsDto.fromJson(response.data);
      }
      throw UnimplementedError();
    });
  }

  @override
  Stream<SettingsDto> saveSettings(SettingsDto settings) {
    throw UnimplementedError();
  }
}
