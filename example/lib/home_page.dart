import 'package:flutter/material.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.t('Hello, world !')),
    );
  }
}
