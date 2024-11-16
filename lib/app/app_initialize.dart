import 'dart:async';

import 'package:book_library/app/environment/app_environment.dart';
import 'package:book_library/app/environment/dev_env.dart';
import 'package:book_library/app/firebase_options.dart';
import 'package:book_library/app/utils/device_info/device_info.dart';
import 'package:book_library/app/utils/package_info/package_info.dart';
import 'package:book_library/core/di/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

@immutable
class AppInitialize {

/// [en] [AppInitialize] responsible for initializing the application process
/// [tr] [AppInitialize] uygulama işlemi başlatmak için sorumlu sınıf
  /// Performs the necessary steps for the application initialization
  /// Uygulama başlatma işlemi için gerekli adımları gerçekleştirir
  Future<void> make() async {
    // Initialize Firebase
    await initializeFirebase();

    // Initialize dependencies
     configureDependencies();

    // Set up a function to handle errors
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  /// Performs the application initialization process
  static Future<void> _initialize() async {
    // Initialize EasyLocalization for translation
    // Çeviri için EasyLocalization'ı başlat
    await EasyLocalization.ensureInitialized();
    /// Set the error level for EasyLocalization logger
    /// EasyLocalization logger'ı için hata seviyesini belirle
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    // Set screen orientation (portrait only)
    // Ekran yönünü ayarla (yalnızca dikey)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set up the application environment (e.g., development environment)
    // Uygulama ortamını ayarla (örneğin, geliştirme ortamı)
    AppEnvironment.setup(config: DevEnv());

    // Initialize package info
    // Paket bilgilerini başlat
    PackageInfoUtils.init();

    // Initialize device info
    // Cihaz bilgilerini başlat
    DeviceInfoUtils.init();

    // Catch and handle Flutter errors
    // Flutter hatalarını yakala ve işle
    FlutterError.onError = (details) {
      /// Send error information to services like Crashlytics
      /// Crashlytics gibi servislere hata bilgisini gönder
  
      /// TODO: Add custom logger
      Logger().e(details.exceptionAsString());
    };
  }

  // Initialize Firebase
  // Firebase'i başlat
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
