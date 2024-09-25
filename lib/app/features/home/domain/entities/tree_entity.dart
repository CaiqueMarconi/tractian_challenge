import 'package:model/app/features/home/domain/entities/item_entity.dart';

class TreeEntity {
  final ItemEntity item;
  final List<dynamic> children;
  TreeEntity({
    required this.item,
    required this.children,
  });

  TreeEntity copyWith({
    ItemEntity? item,
    List<dynamic>? children,
  }) {
    return TreeEntity(
      item: item ?? this.item,
      children: children ?? this.children,
    );
  }
}
