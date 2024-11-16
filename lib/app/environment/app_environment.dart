import 'package:book_library/app/environment/app_configuration.dart';

/// Application environment manager class
final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  // General application environment
  // AppEnvironment.general() {
  //   _config = kDebugMode ? ProdEnv() : DevEnv();
  // }
  static late final AppConfiguration _config;
}

// Get application environment items
enum AppEnvironmentItem {
  baseUrl,
  apiKey;

   String get value {
    try {
      switch (this) {
        case AppEnvironmentItem.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItem.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialize');
    }
  }
}