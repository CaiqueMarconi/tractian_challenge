import '../../domain/entities/location_entity.dart';

class LocationMapper {
  static LocationEntity fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }
}
