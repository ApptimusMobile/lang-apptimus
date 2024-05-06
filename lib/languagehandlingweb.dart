import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'languagehandling_platform_interface.dart';

/// A web implementation of the FlutterLocalizationPlatform of the FlutterLocalization plugin.
class FlutterLocalizationWeb extends FlutterLocalizationPlatform {
  /// Constructs a FlutterLocalizationWeb
  FlutterLocalizationWeb();

  static void registerWith(Registrar registrar) {
    FlutterLocalizationPlatform.instance = FlutterLocalizationWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
