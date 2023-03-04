import 'dart:io';
import 'package:base_flutter/utils/constants/strings.dart';
import 'package:base_flutter/utils/dialog/dialog_helper.dart';
import 'package:dio/dio.dart';

Future<dynamic> handleException(
  Object e, {
  StackTrace? stackTrace,
  Function()? alertCallback,
}) async {
  var message = '';
  switch (e.runtimeType) {
    case SocketException:
      message = RawString.error;
      break;
    case DioException:
      var err = _parseDioError(e as DioException);
      if (err is String) {
        message = err;
      } else {
        return err;
      }
      break;
    default:
      message = 'Something went wrong!';
  }

  if (message.isNotEmpty) {
    await DialogHelper.showAlert(
      message: message,
      onPositionPressed: alertCallback,
      showNegativeButton: false,
    );
  }

  return null;
}

dynamic _parseDioError(DioException err) {
  try {
    if (err.response?.statusCode == HttpStatus.internalServerError ||
        err.response?.statusCode == HttpStatus.gatewayTimeout) {
      return "An error has occurred \n please try again later";
    }

    if (err.error is SocketException) {
      return 'No network connection. Please connect to network and try again!';
    }

    if (err.type == DioExceptionType.connectionTimeout) {
      return 'connect timeout.';
    }

    if (err.type == DioExceptionType.cancel) {
      return err.message;
    }
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      // open login screen
      return "Your account has been deleted, please try another account!";
    }
    return err.response?.data;
  } catch (e) {
    return e.toString();
  }
}
