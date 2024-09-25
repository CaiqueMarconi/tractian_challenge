import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';

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
      typeItemEnum: _setTypeItem(map),
    );
  }

  static TypeItemEnum _setTypeItem(Map<String, dynamic> map) {
    if (map['sensorType'] != null) {
      return TypeItemEnum.component;
    } else {
      return TypeItemEnum.asset;
    }
  }
}
