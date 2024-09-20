class LocationEntity {
  final String id;
  final String name;
  final String? parentId;
  final List<LocationEntity>? locationChildren;
  LocationEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.locationChildren,
  });

  LocationEntity copyWith({
    String? id,
    String? name,
    String? parentId,
    List<LocationEntity>? locationChildren,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      locationChildren: locationChildren ?? this.locationChildren,
    );
  }
}
