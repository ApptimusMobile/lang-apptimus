# Language Handling

Language Handling is a Flutter package for handling language localization and internationalization in your Flutter applications.

## Getting Started

### Prerequisites

Before using this package, ensure you have Flutter installed.

### Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  your_package_name: ^1.0.0
.
```

## Android Configuration

In your `android/app/build.gradle`, make sure you have the following configurations:

```gradle
android {
    ...

    defaultConfig {
        ...
        minSdkVersion 21
        ...
    }
    ...
}
```

## How To Use

### Prepare Language Source

Create a Dart file which will contain all the Map data of the locale languages your app needs. You can change the file name, class name, and file path as desired. For example:

```dart
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
```

## Project Configuration

Initialize the `LanguageHandling` object. This can be done locally or globally, depending on your preference:

```dart
final LanguageHandling localization = LanguageHandling.instance;
```

### Initialize MapLocale List and Startup Language

To initialize the list of `MapLocale` and set the startup language for your app, ensure you perform the following steps in your `main.dart` file or within the `MaterialApp` widget:

```dart
@override
void initState() {
    configureLocalization();
    super.initState();
}
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Testing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: const Homepage(),
    );
  }

  void configureLocalization() {
    localization.init(
        mapLocales: LOCALES, initLanguageCode: "en"); // Pass LOCALES here
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }


```

## Usage

Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
