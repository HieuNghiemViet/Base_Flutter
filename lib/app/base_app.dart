import 'package:base_flutter/enviroments/enviroments.dart';
import 'package:base_flutter/routes/routes.dart';
import 'package:base_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bindings.dart';

class BaseApp extends StatefulWidget {
  final EnvironmentType? environment;

  const BaseApp({Key? key, this.environment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseAppState();
}

class BaseAppState extends State<BaseApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        navigatorKey: Get.key,
        theme: AppTheme.base(Get.theme).appTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteName.splash,
        initialBinding: AppBinding(),
        enableLog: true,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
