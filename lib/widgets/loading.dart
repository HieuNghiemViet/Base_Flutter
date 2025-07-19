import 'package:base_flutter/base.dart';
import 'package:flutter/cupertino.dart';

class IndicatorLoading extends StatelessWidget {
  const IndicatorLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}

void showLoading() {
  if (Get.isDialogOpen == true) {
    return;
  }
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: const IndicatorLoading(),
    ),
    barrierDismissible: false,
  );
}

void hideLoading() {
  if (Get.overlayContext != null) {
    Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
  }
}
