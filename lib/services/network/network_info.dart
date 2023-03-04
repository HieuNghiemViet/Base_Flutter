import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static Future<bool> isConnected() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();

    return result != ConnectivityResult.none;
  }
}
