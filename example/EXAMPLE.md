# Simple language handling application with languagehandling

dart
final LanguageHandling localization = LanguageHandling.instance;

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

# multiple language declaration in localization/local

dart
import 'package:languagehandling/languagehandling.dart';

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
body: '欢迎使用这个本地化 应用程序 %a'
};
}

### you can make your home screen like this

import 'package:languagehandling/languagehandling.dart';

import 'localization/locale.dart';

class Homepage extends StatefulWidget {
const Homepage({super.key});

@override
State<Homepage> createState() => \_HomepageState();
}

class \_HomepageState extends State<Homepage> {
late LanguageHandling \_flutterLocalization;

late String \_currentLocale;
@override
void initState() {
super.initState();
\_flutterLocalization = LanguageHandling.instance;
\_currentLocale = \_flutterLocalization.currentLocale!.languageCode;
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(
LocalData.title.getString(context),
),
actions: [
DropdownButton(
items: const [
DropdownMenuItem(
value: "en",
child: Text(
"English",
)),
DropdownMenuItem(
value: "de",
child: Text(
"German",
)),
DropdownMenuItem(
value: "zh",
child: Text(
"Chiness",
))
],
onChanged: (value) {
\_setLocals(value);
},
)
],
),
body: Container(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 50,
),
child: Text(
context.formatString(LocalData.body, ["januja"]),
style: const TextStyle(
fontSize: 21,
),
),
),
);
}

void \_setLocals(String? value) {
if (value == null) return;
if (value == "en") {
\_flutterLocalization.translate("en");
} else if (value == "de") {
\_flutterLocalization.translate("de");
} else if (value == "zh") {
\_flutterLocalization.translate("zh");
} else {
return;
}

    setState(() {
      _currentLocale = value;
    });

}
}

```

```
