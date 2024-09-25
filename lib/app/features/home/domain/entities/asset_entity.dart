import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';

class AssetEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? sensorId;
  final String? status;
  final String? gatewayId;
  final String? locationId;
  final List<AssetEntity> listChildren;
  final TypeItemEnum typeItemEnum;
  AssetEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorType,
    this.sensorId,
    this.status,
    this.gatewayId,
    this.locationId,
    required this.listChildren,
    required this.typeItemEnum,
  });

  AssetEntity copyWith({
    String? id,
    String? name,
    String? parentId,
    String? sensorType,
    String? sensorId,
    String? status,
    String? gatewayId,
    String? locationId,
    List<AssetEntity>? listChildren,
    TypeItemEnum? typeItemEnum,
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
      listChildren: listChildren ?? this.listChildren,
      typeItemEnum: typeItemEnum ?? this.typeItemEnum,
    );
  }
}
