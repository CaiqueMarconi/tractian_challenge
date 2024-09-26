import 'package:tractian_challenge/app/features/home/domain/helpers/enums/type_item_enum.dart';

import '../../domain/entities/location_entity.dart';

class LocationMapper {
  static LocationEntity fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
      locationChildren: [],
      typeItem: TypeItemEnum.location,
    );
  }
}
