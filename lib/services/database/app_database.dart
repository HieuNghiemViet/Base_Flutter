// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:base_flutter/services/database/dao/alert_dao.dart';
import 'package:base_flutter/services/database/table/entity_table.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    EntityTable,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  EntityDao get entityDao;
}
