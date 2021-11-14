import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      supportedLocales: ['en', 'fr', 'fr_CH'].map((l) => Locale(l)),
      localizationsDelegates: [
        GettextLocalizationsDelegate(defaultLanguage: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        if (locales != null) {
          for (var locale in locales) {
            var supportedLocale = supportedLocales.where((element) =>
                element.languageCode == locale.languageCode &&
                element.countryCode == locale.countryCode);
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
            supportedLocale = supportedLocales.where(
                (element) => element.languageCode == locale.languageCode);
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
          }
        }
        return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.t('Hello, world !')),
    );
  }
}
