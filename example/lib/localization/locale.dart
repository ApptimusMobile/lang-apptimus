import 'package:lang_apptimus/languagehandling.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocalData.EN),
  MapLocale("de", LocalData.DE),
  MapLocale("zh", LocalData.ZH)
];

mixin LocalData {
  static const String title = 'title';
  static const String body = 'body';

  static const Map<String, dynamic> EN = {
    title: 'localization',
    body: 'Welcome to this localization flutter application %a'
  };

  static const Map<String, dynamic> DE = {
    title: 'Lokalisierung',
    body: 'Willkommen bei dieser Lokalisierungs-Anwendung %a'
  };

  static const Map<String, dynamic> ZH = {
    title: '本地化',
    body: '欢迎使用这个本地化  应用程序 %a'
  };
}
