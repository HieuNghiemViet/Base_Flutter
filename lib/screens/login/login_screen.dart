import 'package:base_flutter/base.dart';

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
