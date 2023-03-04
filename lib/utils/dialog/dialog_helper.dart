import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DialogHelper {
  static Future showAlert({
    BuildContext? context,
    String? title,
    String? message,
    bool showNegativeButton = true,
    VoidCallback? onPositionPressed,
    VoidCallback? onNegativePressed,
    String? positionLabel,
    String? negativeLabel,
    TextAlign? messageAlign,
    bool willPopScope = false,
  }) {
    final action = [
      CupertinoDialogAction(
        isDefaultAction: false,
        onPressed: () {
          onPositionPressed?.call();
          Navigator.of(context ?? Get.overlayContext!, rootNavigator: true)
              .pop();
        },
        child: Text(
          positionLabel ?? "OK",
        ),
      )
    ];
    if (showNegativeButton) {
      action.insert(
          0,
          CupertinoDialogAction(
            isDefaultAction: false,
            onPressed: () {
              onNegativePressed?.call();
              Navigator.of(context ?? Get.overlayContext!, rootNavigator: true)
                  .pop();
            },
            child: Text(
              negativeLabel ?? "Cancel",
            ),
          ));
    }
    return showCupertinoDialog(
      context: context ?? Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return willPopScope;
        },
        child: CupertinoAlertDialog(
          title: title != null
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                )
              : null,
          content: message != null
              ? Text(
                  message,
                  textAlign: messageAlign ?? TextAlign.center,
                )
              : null,
          actions: action,
        ),
      ),
    );
  }
}
