import 'package:base_flutter/services/api/api_path.dart';
import 'package:base_flutter/services/api/api_service.dart';

class UserRepository {

  static Future<dynamic> getInfo() async {
    final response = await ApiService().get(ApiPath.info);
    return response;
  }
}
