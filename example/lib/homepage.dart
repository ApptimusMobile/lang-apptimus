import 'package:flutter/material.dart';
import 'package:lang_apptimus/languagehandling.dart';

import 'localization/locale.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late LanguageHandling _flutterLocalization;

  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = LanguageHandling.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
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
              _setLocals(value);
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

  void _setLocals(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "de") {
      _flutterLocalization.translate("de");
    } else if (value == "zh") {
      _flutterLocalization.translate("zh");
    } else {
      return;
    }

    setState(() {
      _currentLocale = value;
    });
  }
}
