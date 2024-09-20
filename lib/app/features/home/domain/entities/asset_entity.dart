class AssetEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;
  final String? locationId;
  final List<AssetEntity> listChildren;
  AssetEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
    required this.listChildren,
  });

  AssetEntity copyWith({
    String? id,
    String? name,
    String? parentId,
    String? sensorType,
    String? status,
    String? gatewayId,
    String? locationId,
    List<AssetEntity>? listChildren,
  }) {
    return AssetEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sensorType: sensorType ?? this.sensorType,
      status: status ?? this.status,
      gatewayId: gatewayId ?? this.gatewayId,
      locationId: locationId ?? this.locationId,
      listChildren: listChildren ?? this.listChildren,
    );
  }
}
