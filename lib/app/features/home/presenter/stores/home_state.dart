import 'package:model/app/features/home/domain/entities/companie_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';

import '../../domain/helpers/enums/type_state_enum.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  final List<TreeEntity> listAssets;
  final List<CompanyEntity> listCompanies;
  final TypeStateEnum? typeAsset;
  final List<TreeEntity> listTreeNode;
  HomeState({
    required this.listLocation,
    required this.listAssets,
    required this.listCompanies,
    this.typeAsset,
    required this.listTreeNode,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
        listAssets: [],
        listCompanies: [],
        listTreeNode: [],
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
    List<TreeEntity>? listAssets,
    List<CompanyEntity>? listCompanies,
    TypeStateEnum? typeAsset,
    List<TreeEntity>? listTreeNode,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
      listAssets: listAssets ?? this.listAssets,
      listCompanies: listCompanies ?? this.listCompanies,
      typeAsset: typeAsset,
      listTreeNode: listTreeNode ?? this.listTreeNode,
    );
  }
}
