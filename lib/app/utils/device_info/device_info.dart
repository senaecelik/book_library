import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

final class DeviceInfoUtils {
  DeviceInfoUtils._();

  static late final DeviceInfoPlugin _deviceInfo;

  static Future<void> init() async {
    _deviceInfo = DeviceInfoPlugin();
  }

  static Future<String?> getDeviceId() async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await _deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await _deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }  else {
      return null;
    }
  }

  static Future<String?> getDeviceInfo() async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await _deviceInfo.iosInfo;
      return iosDeviceInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await _deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    } else {
      return null;
    }
  }

  static String getPlatformName() {
    if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isAndroid) {
      return 'ANDROID';
    } else {
      return 'UNKNOWN';
    }
  }
}