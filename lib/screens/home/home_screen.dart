import 'package:base_flutter/languages/language.dart';
import 'package:base_flutter/screens/home/controller/home_controller.dart';
import 'package:base_flutter/theme/colors.dart';
import 'package:base_flutter/utils/dialog/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("HomeScreen"),
            Text(L.current.appName.tr),
            ElevatedButton(
              onPressed: () {
                DialogHelper.showAlert(message: "HieuNV");
              },
              child: const Text('Yes'),
            )
          ],
        ),
      ),
    );
  }
}
