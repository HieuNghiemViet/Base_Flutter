import 'package:base_flutter/services/database/constant.dart';
import 'package:base_flutter/services/database/table/entity_table.dart';
import 'package:floor/floor.dart';

@dao
abstract class EntityDao {

  @Query('SELECT * FROM ${DBConstant.DB_NAME}')
  Future<List<EntityTable>> getAll();
}
