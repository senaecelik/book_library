



import 'package:flutter/foundation.dart';

const iOSClientId = '205766427957-8hf6u8e3rlg9cs80seufasqfhdkvq5r.apps.googleusercontent.com';
const webClientId = '205766427957-iurnl11vdicqahqckdbhp2q557oli2rd.apps.googleusercontent.com';

String get googleClientId {
  return switch (defaultTargetPlatform) {
     TargetPlatform.macOS || TargetPlatform.iOS => iOSClientId,
    _ => webClientId,
  };

}