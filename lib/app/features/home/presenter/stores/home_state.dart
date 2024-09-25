import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';

class HomeState {
  final List<LocationEntity> listLocation;
  final List<TreeEntity> listAssets;
  final List<CompanyEntity> listCompanies;
  final List<TreeEntity> listTreeNode;
  final List<TreeEntity> listTreeNodeSearched;
  final String searchQuery;
  final bool typeAlertSelected;
  final bool typeSensorSelected;
  final bool loadingDataTreeNode;
  HomeState({
    required this.listLocation,
    required this.listAssets,
    required this.listCompanies,
    required this.listTreeNode,
    required this.listTreeNodeSearched,
    required this.searchQuery,
    required this.typeAlertSelected,
    required this.typeSensorSelected,
    required this.loadingDataTreeNode,
  });

  factory HomeState.init() => HomeState(
        listLocation: [],
        listAssets: [],
        listCompanies: [],
        listTreeNode: [],
        searchQuery: '',
        listTreeNodeSearched: [],
        typeAlertSelected: false,
        typeSensorSelected: false,
        loadingDataTreeNode: false,
      );

  HomeState copyWith({
    List<LocationEntity>? listLocation,
    List<TreeEntity>? listAssets,
    List<CompanyEntity>? listCompanies,
    List<TreeEntity>? listTreeNode,
    List<TreeEntity>? listTreeNodeSearched,
    String? searchQuery,
    bool? typeAlertSelected,
    bool? typeSensorSelected,
    bool? loadingDataTreeNode,
  }) {
    return HomeState(
      listLocation: listLocation ?? this.listLocation,
      listAssets: listAssets ?? this.listAssets,
      listCompanies: listCompanies ?? this.listCompanies,
      listTreeNode: listTreeNode ?? this.listTreeNode,
      listTreeNodeSearched: listTreeNodeSearched ?? this.listTreeNodeSearched,
      searchQuery: searchQuery ?? this.searchQuery,
      typeAlertSelected: typeAlertSelected ?? this.typeAlertSelected,
      typeSensorSelected: typeSensorSelected ?? this.typeSensorSelected,
      loadingDataTreeNode: loadingDataTreeNode ?? this.loadingDataTreeNode,
    );
  }
}
