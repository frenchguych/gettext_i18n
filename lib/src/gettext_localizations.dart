import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gettext/gettext.dart';
import 'package:gettext_parser/gettext_parser.dart' as gettext_parser;

class GettextLocalizations {
  final _gt = Gettext(
    onWarning: ((message) {
      if (kDebugMode) {
        final r = RegExp(r'^No translation was found for msgid "(.*)" in msgctxt "(.*)" and domain "(.*)"$');
        final matches = r.firstMatch(message);
        var msgid = matches!.group(1);
        // ignore: avoid_print
        print('\nmsgid "$msgid"\nmsgstr ""\n \n');
      }
    }),
  );

  GettextLocalizations.fromPO(String poContent) {
    _gt.addLocale(gettext_parser.po.parse(poContent));
  }

  static GettextLocalizations of(BuildContext context) => Localizations.of<GettextLocalizations>(context, GettextLocalizations)!;

  String t(String key, List<Object>? args) {
    var message = _gt.gettext(key);

    if (args != null) {
      for (var i = 0; i < args.length; i++) {
        message = message.replaceAll('{$i}', args[i.toInt()].toString());
      }
    }

    return message;
  }
}
