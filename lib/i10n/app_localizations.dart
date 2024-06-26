import 'package:flutter/cupertino.dart';
import 'package:front_scaffold_flutter/i10n/strings_translate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  Map<String, String> _localizedStrings = {};

  Future<void> load() async {
    final translations = getTranslations(locale.languageCode);
    _localizedStrings = translations;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es_ES', 'es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

class AppCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const AppCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es_ES', 'es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(AppCupertinoLocalizationsDelegate old) => false;
}
