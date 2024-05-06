import 'package:flutter/material.dart';
import 'package:lang_apptimus/src/localization/language_handling_translator.dart';

extension StringExtension on String {
  String getString(BuildContext context) =>
      LanguageHandlingTranslator.of(context)?.getString(this) ??
      '$this not found';
}
