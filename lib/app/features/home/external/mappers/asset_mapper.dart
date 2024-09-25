import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';

class AssetMapper {
  static AssetEntity fromMap(Map<String, dynamic> map) {
    return AssetEntity(
      id: map['id'],
      name: map['name'],
      status: _setTypeStatusItem(map),
      gatewayId: map['gatewayId'],
      parentId: map['parentId'],
      children: [],
      sensorType: map['sensorType'],
      locationId: map['locationId'],
      typeItem: _setTypeItem(map),
    );
  }

  static TypeItemEnum _setTypeItem(Map<String, dynamic> map) {
    if (map['sensorType'] != null) {
      return TypeItemEnum.component;
    } else {
      return TypeItemEnum.asset;
    }
  }

  static TypeStateEnum? _setTypeStatusItem(Map<String, dynamic> map) {
    if (map['status'] != null && map['status'] == 'operating') {
      return TypeStateEnum.sensor;
    } else if (map['status'] != null && map['status'] == 'critic') {
      return TypeStateEnum.critical;
    } else {
      return null;
    }
  }
}
