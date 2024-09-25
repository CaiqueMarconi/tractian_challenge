import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';

import '../helpers/enums/type_state_enum.dart';

class AssetEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? sensorId;
  final TypeStateEnum? status;
  final String? gatewayId;
  final String? locationId;
  final List<AssetEntity>? children;
  final TypeItemEnum typeItem;
  AssetEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorType,
    this.sensorId,
    this.status,
    this.gatewayId,
    this.locationId,
    this.children,
    required this.typeItem,
  });

  AssetEntity copyWith({
    String? id,
    String? name,
    String? parentId,
    String? sensorType,
    String? sensorId,
    TypeStateEnum? status,
    String? gatewayId,
    String? locationId,
    List<AssetEntity>? children,
    TypeItemEnum? typeItem,
  }) {
    return AssetEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sensorType: sensorType ?? this.sensorType,
      sensorId: sensorId ?? this.sensorId,
      status: status ?? this.status,
      gatewayId: gatewayId ?? this.gatewayId,
      locationId: locationId ?? this.locationId,
      children: children ?? this.children,
      typeItem: typeItem ?? this.typeItem,
    );
  }
}
