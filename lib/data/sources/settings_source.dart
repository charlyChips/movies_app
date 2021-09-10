import '../models/settings_dto.dart';

abstract class SettingsSource {
  Stream<SettingsDto> getSettings();
  Stream<SettingsDto> saveSettings(SettingsDto settings);
}
