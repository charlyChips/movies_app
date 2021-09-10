import '../domain/models/settings.dart';
import '../domain/repositories/settings_repository.dart';
import 'models/settings_dto.dart';
import 'sources/settings_source.dart';

class SettingsDataRepository implements SettingsRepository {
  SettingsDataRepository({
    required this.remoteSource,
    required this.cacheSource,
  });

  final SettingsSource remoteSource;
  final SettingsSource cacheSource;

  @override
  Stream<Settings> getSettings() async* {
    yield* cacheSource
        .getSettings()
        .asyncExpand((SettingsDto cachedSettings) async* {
      if (cachedSettings.images == null) {
        yield* _downloadSettings();
      } else {
        yield cachedSettings;
      }
    }).map((SettingsDto dto) => Settings(
            images: SettingsImages(
                backdropSizes: dto.images?.backdropSizes ?? [],
                baseUrl: dto.images?.baseUrl ?? '',
                logoSizes: dto.images?.logoSizes ?? [],
                posterSizes: dto.images?.posterSizes ?? [],
                profileSizes: dto.images?.profileSizes ?? [],
                secureBaseUrl: dto.images?.secureBaseUrl ?? '',
                stillSizes: dto.images?.stillSizes ?? []),
            changeKeys: dto.changeKeys ?? []));
  }

  Stream<SettingsDto> _downloadSettings() async* {
    yield* remoteSource.getSettings().asyncExpand(
        (SettingsDto remoteSettings) =>
            cacheSource.saveSettings(remoteSettings));
  }
}
