# Flutter i18n with gettext

This package helps internationalizing a Flutter application.

It is based on [gettext](https://pub.dev/packages/gettext) and [gettext_parser](https://pub.dev/packages/gettext_parser).

## Features

- Supports from placeholders in the message keys

## Usage

In `pubspec.yaml`, add `assets/i18n/` as an asset folder :

```yaml
flutter:
  assets:
    - assets/i18n/
```

In that folder, place your translation files : 
```shell
$ ls assets/i18n/
en.po
fr_CH.po
fr.po
```

In your application file, declare supported locales, and initialize translations :

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        ...
        home: const HomePage(),
        supportedLocales: const [
            Locale('en'),
            Locale('fr'),
            Locale('fr', 'CH'),
        ],
        localizationsDelegates: [
            GettextLocalizationsDelegate(defaultLanguage: 'en'),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
        ],
    );
  }
}
```

In files where you want to translate a string :

```dart
import 'package:gettext_i18n/gettext_i18n.dart';

var translatedString = context.t('{2} ! Pi is greater than {0} and smaller than {1}', args: [3, 4, 'Hello']);
```

## Additional information

`.po` files can be edited by hand, but it's preferable to use an editor or an online service to manage them.