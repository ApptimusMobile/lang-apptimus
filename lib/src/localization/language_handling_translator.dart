import 'dart:async';

import 'package:flutter/material.dart';

import '../data/language_name.dart';
import '../model/map_locale.dart';

class LanguageHandlingTranslator {
  LanguageHandlingTranslator._singleton();

  static final LanguageHandlingTranslator instance =
      LanguageHandlingTranslator._singleton();

  static Map<String, dynamic> _string = {};
  static List<MapLocale> _mapLocales = [];

  static LanguageHandlingTranslator? of(BuildContext context) =>
      Localizations.of<LanguageHandlingTranslator>(
          context, LanguageHandlingTranslator);

  set mapLocales(List<MapLocale> mapLocales) => _mapLocales = mapLocales;

  /// This function will load the value from the specific map data that provided
  /// by the [MapLocale] object from the initialization and return an instance
  /// of the [LanguageHandlingTranslator] class as a Future.
  Future<LanguageHandlingTranslator> load(Locale locale) async {
    _string = _mapLocales
        .where((e) => e.languageCode == locale.languageCode)
        .first
        .mapData;
    return instance;
  }

  /// This function will return the value of the map data which loaded by the
  /// [load] function above.
  String getString(String key) =>
      _string[key] == null ? '$key not found' : _string[key].toString();

  /// This function is the same as [getString] above. But instead of returning
  /// 'key not found', this will return onl the key
  String getStringOrKey(String key) =>
      _string[key] == null ? key : _string[key].toString();

  /// This function will return the language name by the language code provided.
  String getName(String languageCode) => languageName[languageCode] == null
      ? 'Name for $languageCode not found'
      : languageName[languageCode].toString();
}
