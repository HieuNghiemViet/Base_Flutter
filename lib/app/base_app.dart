import 'dart:async';
import 'package:base_flutter/base.dart';
import 'package:base_flutter/enviroments/enviroments.dart';
import 'package:base_flutter/services/observer/app_lifecycle_observer.dart';
import 'package:flutter/foundation.dart';
import 'app_bindings.dart';

class BaseApp extends StatefulWidget {
  final EnvironmentType? environment;

  const BaseApp({super.key, this.environment});

  @override
  State<StatefulWidget> createState() => BaseAppState();
}

class BaseAppState extends State<BaseApp> with WidgetsBindingObserver {
  StreamSubscription? appLifeCycleSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(AppLifecycleObserver());
    if (kDebugMode) {
      print('start app lifecycle observer');
    }

    appLifeCycleSubscription =
        AppLifecycleObserver().status.listen((AppLifecycleState state) {
      if (kDebugMode) {
        print(Get.currentRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        navigatorKey: Get.key,
        locale: Get.locale,
        theme: AppTheme.base(Get.theme).appTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteName.splash,
        initialBinding: AppBinding(),
        enableLog: true,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(AppLifecycleObserver());
    appLifeCycleSubscription?.cancel();
    super.dispose();
  }
}
