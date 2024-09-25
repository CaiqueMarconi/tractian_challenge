import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';

import '../../domain/helpers/enums/type_state_enum.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  final List<TreeEntity> listAssets;
  final List<CompanyEntity> listCompanies;
  final TypeStateEnum? typeAsset;
  final List<TreeEntity> listTreeNode;
  final List<TreeEntity> listTreeNodeSearched;
  final String searchQuery;
  HomeState({
    required this.listLocation,
    required this.listAssets,
    required this.listCompanies,
    this.typeAsset,
    required this.listTreeNode,
    required this.listTreeNodeSearched,
    required this.searchQuery,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
        listAssets: [],
        listCompanies: [],
        listTreeNode: [],
        searchQuery: '',
        listTreeNodeSearched: [],
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
    List<TreeEntity>? listAssets,
    List<CompanyEntity>? listCompanies,
    TypeStateEnum? typeAsset,
    List<TreeEntity>? listTreeNode,
    List<TreeEntity>? listTreeNodeSearched,
    String? searchQuery,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
      listAssets: listAssets ?? this.listAssets,
      listCompanies: listCompanies ?? this.listCompanies,
      typeAsset: typeAsset ?? this.typeAsset,
      listTreeNode: listTreeNode ?? this.listTreeNode,
      listTreeNodeSearched: listTreeNodeSearched ?? this.listTreeNodeSearched,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
