import 'package:base_flutter/services/database/app_database.dart';
import 'package:base_flutter/services/database/constant.dart';
import 'package:base_flutter/services/database/dao/alert_dao.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  late AppDatabase database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _databaseHelper;

  Future initDataBase() async {
    database =
        await $FloorAppDatabase.databaseBuilder(DBConstant.DB_NAME).build();
  }

  EntityDao get entityDao => database.entityDao;
}
