import 'package:base_flutter/routes/routes.dart';
import 'package:base_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(RouteName.root);
            },
            child: const Text('Login')),
      ),
    );
  }
}
