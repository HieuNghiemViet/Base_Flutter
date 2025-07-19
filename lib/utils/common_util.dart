import 'dart:convert' show utf8;
import 'dart:io';
import 'package:base_flutter/base.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String getErrorMessage(BuildContext context, dynamic error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connect Timeout Error";
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return "No Network Error";
        }
        break;
      default:
        break;
    }
  }

  if (error is DioException) {
    return error.message ?? "unknownError";
  }
  // TODO
  return error.toString();
}

bool isPhoneValid(String phoneNumber) {
  bool lengthValid;
  if (phoneNumber.startsWith("0")) {
    lengthValid = phoneNumber.length == 10;
  } else {
    lengthValid = phoneNumber.length == 9;
  }
  RegExp numeric = RegExp(r'^-?[0-9]+$');
  return phoneNumber.isNotEmpty && lengthValid && numeric.hasMatch(phoneNumber);
}

bool isEmailValid(String email) {
  RegExp email0 = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return email.isNotEmpty && email0.hasMatch(email);
}

Future<String?> deviceToken() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  var data = await deviceInfoPlugin.deviceInfo;
  return "";
}

String hashParam(List<String> params) {
  var combineString = "";
  for (final param in params) {
    combineString += param;
  }

  var key = utf8.encode("sdlfjslwueowqurxm.mvbmu03919;smbvmp1124404-50846mlkj");
  var bytes = utf8.encode(combineString);

  var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  var digest = hmacSha256.convert(bytes);
  return digest.toString();
}

Future<void> launchUrl(String url) async {
  if (await launcher.canLaunchUrl(Uri.parse(url))) {
    launcher.launchUrl(Uri.parse(url));
  }
}
