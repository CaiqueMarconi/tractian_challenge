import 'asset_entity.dart';

class TreeEntity {
  final AssetEntity item;
  final List<dynamic> children;
  TreeEntity({
    required this.item,
    required this.children,
  });

  TreeEntity copyWith({
    AssetEntity? item,
    List<dynamic>? children,
  }) {
    return TreeEntity(
      item: item ?? this.item,
      children: children ?? this.children,
    );
  }
}
