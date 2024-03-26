import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter/i10n/app_localizations.dart';

extension AppLocalization on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeName() {
    return split(' ')
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
