import 'package:base_flutter/app/app_controller.dart';
import 'package:base_flutter/services/network/network_info.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    injectNetworkDependencies();
    injectControllers();
  }

  void injectControllers() {
    Get.put(AppController());
  }

  void injectNetworkDependencies() {
    Get.put(NetworkInfo());
  }
}
