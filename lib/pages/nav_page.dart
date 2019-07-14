import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/provider_config.dart';
import 'package:todo_list/i10n/localization_intl.dart';
import 'package:todo_list/pages/language_page.dart';
import 'package:todo_list/pages/setting_page.dart';
import 'package:todo_list/pages/theme_page.dart';
import 'package:todo_list/widgets/nav_head.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        NavHead(),
        ListTile(
          title: Text(DemoLocalizations.of(context).languageTitle),
          leading: Icon(Icons.language),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, new CupertinoPageRoute(builder: (ctx) {
              return LanguagePage();
            }));
          },
        ),
        ListTile(
          title: Text(DemoLocalizations.of(context).changeTheme),
          leading: Icon(Icons.color_lens),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, new CupertinoPageRoute(builder: (ctx) {
              return ProviderConfig.getInstance().getThemePage();
            }));
          },
        ),
        ListTile(
          title: Text(DemoLocalizations.of(context).appSetting),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, new CupertinoPageRoute(builder: (ctx) {
              return SettingPage();
            }));
          },
        ),

      ],
    );
  }


}