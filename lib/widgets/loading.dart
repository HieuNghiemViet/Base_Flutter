import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicatorLoading extends StatelessWidget {
  const IndicatorLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: CupertinoActivityIndicator(
        color: Colors.white,
        radius: 16,
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
