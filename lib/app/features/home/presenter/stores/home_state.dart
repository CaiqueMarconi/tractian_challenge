import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  final List<AssetEntity> listAssets;
  HomeState({
    required this.listLocation,
    required this.listAssets,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
        listAssets: [],
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
    List<AssetEntity>? listAssets,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
      listAssets: listAssets ?? this.listAssets,
    );
  }
}
