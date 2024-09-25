import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/external/mappers/item_mapper.dart';

class TreeMapper {
  static TreeEntity fromMap(Map<String, dynamic> map) {
    return TreeEntity(
      item: ItemMapper.fromMap(map),
      children: [],
    );
  }
}
