import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';

class LocationEntity {
  final String id;
  final String name;
  final String? parentId;
  final List<dynamic> locationChildren;
  final TypeItemEnum typeItem;
  LocationEntity({
    required this.id,
    required this.name,
    this.parentId,
    required this.locationChildren,
    required this.typeItem,
  });

  LocationEntity copyWith({
    String? id,
    String? name,
    String? parentId,
    List<dynamic>? locationChildren,
    TypeItemEnum? typeItem,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      locationChildren: locationChildren ?? this.locationChildren,
      typeItem: typeItem ?? this.typeItem,
    );
  }
}
