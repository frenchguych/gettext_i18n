import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gettext/gettext.dart';
import 'package:gettext_parser/gettext_parser.dart' as gettext_parser;

class GettextLocalizations {
  static var throwException = false;

  static void onWarning(String message) {
    if (kDebugMode) {
      if (throwException) {
        throw Exception(message);
      } else {
        debugPrint(message);
      }
    }
  }

  final _gt = Gettext(
    onWarning: GettextLocalizations.onWarning,
  );

  GettextLocalizations.fromPO(String poContent) {
    _gt.addLocale(gettext_parser.po.parse(poContent));
  }

  static GettextLocalizations of(BuildContext context) =>
      Localizations.of<GettextLocalizations>(context, GettextLocalizations)!;

  String t(String key, List<Object>? args) {
    var message = _gt.gettext(key);

    if (args != null) {
      for (var i = 0; i < args.length; i++) {
        message = message.replaceAll('{$i}', args[i.toInt()].toString());
      }
    }

    return message;
  }

  void enableExceptions(bool enable) {
    throwException = enable;
  }
}
