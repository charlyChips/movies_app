class Settings {
  Settings({this.changeKeys, this.images});

  SettingsImages? images;
  List<String>? changeKeys;
}

class SettingsImages {
  SettingsImages({
    required this.baseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.secureBaseUrl,
    required this.stillSizes,
  });

  String baseUrl;
  String secureBaseUrl;
  List<String> backdropSizes;
  List<String> logoSizes;
  List<String> posterSizes;
  List<String> profileSizes;
  List<String> stillSizes;
}
