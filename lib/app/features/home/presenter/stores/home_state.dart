import 'package:model/app/features/home/domain/entities/location_entity.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  HomeState({
    required this.listLocation,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
    );
  }
}
