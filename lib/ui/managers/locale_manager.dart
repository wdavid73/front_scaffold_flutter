import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:front_scaffold_flutter/i10n/app_localizations.dart';

abstract class LocaleManager {
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    AppCupertinoLocalizationsDelegate(),
  ];

  static const List<Locale> supportedLocales = [
    Locale('es', 'ES'),
    Locale('es'),
    Locale('en', 'US'),
  ];
}
