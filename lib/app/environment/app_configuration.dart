

/// Project configuration values 
abstract class AppConfiguration {

  static const String developmentPath = 'assets/env/.dev.env';
  static const String productionPath = 'assets/env/.prod.env';

  ///base url
  String get baseUrl;

  ///api key
  String get apiKey;

  

}