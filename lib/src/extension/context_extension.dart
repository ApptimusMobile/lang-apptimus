import 'package:flutter/material.dart';
import 'package:lang_apptimus/src/localization/language_handling_translator.dart';

extension ContextExtension on BuildContext {
  String formatString(String fullText, List<dynamic> args) {
    final translator = LanguageHandlingTranslator.of(this);
    fullText = '${translator?.getStringOrKey(fullText)}';
    for (final element in args) {
      final replace = '${translator?.getStringOrKey(element.toString())}';
      fullText = fullText.replaceFirst('%a', replace);
    }
    return fullText;
  }
}
