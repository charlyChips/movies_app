import '../data/models/settings_dto.dart';
import '../data/sources/settings_source.dart';

class SettingsCacheSource implements SettingsSource {
  SettingsDto _settings = SettingsDto();

  @override
  Stream<SettingsDto> getSettings() async* {
    yield _settings;
  }

  @override
  Stream<SettingsDto> saveSettings(SettingsDto settings) async* {
    _settings = settings;
    yield _settings;
  }
}
