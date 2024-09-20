import 'package:model/app/features/home/domain/entities/asset_entity.dart';

class AssetMapper {
  static AssetEntity fromMap(Map<String, dynamic> map) {
    return AssetEntity(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      gatewayId: map['gatewayId'],
      parentId: map['parentId'],
      listChildren: [],
      sensorType: map['sensorType'],
      locationId: map['locationId'],
    );
  }
}
