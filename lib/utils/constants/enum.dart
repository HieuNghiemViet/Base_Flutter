import 'package:base_flutter/languages/language.dart';
import 'package:base_flutter/screens/home/home_screen.dart';
import 'package:base_flutter/screens/merchandise/merchandise_screen.dart';
import 'package:base_flutter/screens/order/record_screen.dart';
import 'package:base_flutter/screens/setting/setting_screen.dart';
import 'package:base_flutter/theme/icons.dart';
import 'package:flutter/material.dart';

enum MainTab {
  home,
  merchandise,
  order,
  settings,
}

extension MainTabExt on MainTab {
  String get icon {
    switch (this) {
      case MainTab.home:
        return AppIcons.home;
      case MainTab.merchandise:
        return AppIcons.merchandise;
      case MainTab.order:
        return AppIcons.order;
      case MainTab.settings:
        return AppIcons.setting;
    }
  }

  String get title {
    switch (this) {
      case MainTab.home:
        return L.current.home;
      case MainTab.merchandise:
        return L.current.merchandise;
      case MainTab.order:
        return L.current.order;
      case MainTab.settings:
        return L.current.setting;
    }
  }

  Widget get screen {
    switch (this) {
      case MainTab.home:
        return HomeScreen();
      case MainTab.merchandise:
        return MerchandiseScreen();
      case MainTab.order:
        return OrderScreen();
      case MainTab.settings:
        return SettingsScreen();
    }
  }
}
