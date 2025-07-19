import 'package:base_flutter/base.dart';
import 'package:base_flutter/screens/components_screen.dart';

import 'controller/home_controller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
            ),
          ],
        ),
      ),
    );
  }
}

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
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ComponentsScreen());
              },
              child: const Text('Components Screen'),
            )
          ],
        ),
      ),
    );
  }
}
