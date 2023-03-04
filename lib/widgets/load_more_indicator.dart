import 'package:base_flutter/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      child: const CupertinoActivityIndicator(),
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
