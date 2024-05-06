import 'package:flutter/material.dart';
import 'package:lang_apptimus/languagehandling.dart';
import 'package:lang_apptimus/src/localization/language_handling_translator.dart';

class LanguageHandlingDelegate
    extends LocalizationsDelegate<LanguageHandlingTranslator> {
  LanguageHandlingDelegate(this.newLocale);

  final Locale? newLocale;

  /// The override function from [LocalizationsDelegate] to check the supported
  /// language provided by the app configuration
  @override
  bool isSupported(Locale locale) =>
      LanguageHandling.instance.supportedLanguageCodes
          .contains(locale.languageCode);

  /// The override function from [LocalizationsDelegate] to load the locale
  @override
  Future<LanguageHandlingTranslator> load(Locale locale) =>
      LanguageHandlingTranslator.instance.load(newLocale ?? locale);

  /// The override function from [LocalizationsDelegate] to reload the locale.
  @override
  bool shouldReload(LocalizationsDelegate<LanguageHandlingTranslator> old) =>
      true;
}
