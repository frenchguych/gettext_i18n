import 'package:flutter/material.dart';
import 'gettext_localizations.dart';

extension ContextExt on BuildContext {
  String t(String key, {List<Object>? args}) =>
      GettextLocalizations.of(this).t(key, args);
}
