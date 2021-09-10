import '../models/settings.dart';

abstract class SettingsRepository {
  Stream<Settings> getSettings();
}
