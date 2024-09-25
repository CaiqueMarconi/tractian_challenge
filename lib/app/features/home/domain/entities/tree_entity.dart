import 'package:model/app/features/home/domain/entities/item_entity.dart';

import 'asset_entity.dart';

class TreeEntity {
  final AssetEntity item;
  final List<dynamic> children;
  TreeEntity({
    required this.item,
    required this.children,
  });
}
