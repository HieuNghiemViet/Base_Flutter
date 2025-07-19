import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static Future<bool> isConnectedInternet() async {
    List<ConnectivityResult> results = await Connectivity().checkConnectivity();

    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.mobile);
  }
}
