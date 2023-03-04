import 'package:base_flutter/screens/home/home_screen.dart';
import 'package:base_flutter/screens/login/login_screen.dart';
import 'package:base_flutter/screens/map/map_screen.dart';
import 'package:base_flutter/screens/record/record_screen.dart';
import 'package:base_flutter/screens/root/root_screen.dart';
import 'package:base_flutter/screens/setting/setting_screen.dart';
import 'package:base_flutter/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteName {
  static const String splash = "splash";
  static const String login = "login";
  static const String root = "root";
  static const String home = "home";
  static const String map = "map";
  static const String record = "record";
  static const String setting = "setting";
}

class AppRoutes {
  static final screens = <String, Widget Function()>{
    RouteName.splash: () => const SplashScreen(),
    RouteName.root: () => const RootScreen(),
    RouteName.home: () => HomeScreen(),
    RouteName.map: () => const MapScreen(),
    RouteName.setting: () => const SettingsScreen(),
    RouteName.record: () => const RecordScreen(),
    RouteName.login: () => const LoginScreen(),
  };

  static final bindings = <String, List<Bindings> Function()>{};

  static GetPageRoute generateRoute(RouteSettings settings) {
    return GetPageRoute(
      settings:
          RouteSettings(name: settings.name, arguments: settings.arguments),
      page: screens[settings.name] ?? getDefaultScreen,
      bindings: bindings[settings.name]?.call(),
    );
  }

  static Widget getDefaultScreen() => const Scaffold(
        backgroundColor: Colors.white,
      );
}
