import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/entities/companie_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import '../../domain/helpers/enums/type_state_enum.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  final List<AssetEntity> listAssets;
  final List<CompanyEntity> listCompanies;
  final TypeStateEnum? typeAsset;
  HomeState({
    required this.listLocation,
    required this.listAssets,
    required this.listCompanies,
    this.typeAsset,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
        listAssets: [],
        listCompanies: [],
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
    List<AssetEntity>? listAssets,
    List<CompanyEntity>? listCompanies,
    TypeStateEnum? typeAsset,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
      listAssets: listAssets ?? this.listAssets,
      listCompanies: listCompanies ?? this.listCompanies,
      typeAsset: typeAsset,
    );
  }
}
