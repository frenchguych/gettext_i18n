import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gettext_localizations.dart';

class GettextLocalizationsDelegate extends LocalizationsDelegate<GettextLocalizations> {
  GettextLocalizationsDelegate({this.defaultLanguage = "en"});

  final String defaultLanguage;

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<GettextLocalizations> load(Locale locale) async {
    var poContent = '';
    try {
      poContent = await rootBundle.loadString('assets/i18n/${locale.languageCode}_${locale.countryCode}.po');
    } catch (e) {
      try {
        poContent = await rootBundle.loadString('assets/i18n/${locale.languageCode}.po');
      } catch (e) {
        poContent = await rootBundle.loadString('assets/i18n/$defaultLanguage.po');
      }
    }

    return GettextLocalizations.fromPO(poContent);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<GettextLocalizations> old) => true;
}
