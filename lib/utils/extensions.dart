import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter/i10n/app_localizations.dart';

extension AppLocalization on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}
