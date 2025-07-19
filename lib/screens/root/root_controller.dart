import 'package:base_flutter/base.dart';

class RootController extends GetxController {
  static RootController get instance => Get.find<RootController>();

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or services here
  }

  @override
  void onReady() {
    super.onReady();
    // Perform actions when the controller is ready
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}
