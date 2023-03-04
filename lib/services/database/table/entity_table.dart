import 'package:floor/floor.dart';

@Entity(tableName: 'ENTITY_TABLE')
class EntityTable {
  @primaryKey
  @ColumnInfo(name: "id")
  final String id;
  @ColumnInfo(name: "name")
  final int name;

  EntityTable({
    required this.id,
    required this.name,
  });
}
