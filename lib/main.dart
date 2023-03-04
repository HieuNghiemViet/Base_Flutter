import 'package:base_flutter/app/base_app.dart';
import 'package:base_flutter/enviroments/enviroments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'services/database/database_helper.dart';
import 'services/shared_data/storage_service.dart';

void mainApp(EnvironmentType environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment.config(environment);

  await DatabaseHelper().initDataBase();
  await StorageService().init();

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MaterialApp(
        home: BaseApp(
          environment: environment,
        ),
      );
    },
  ));
}
