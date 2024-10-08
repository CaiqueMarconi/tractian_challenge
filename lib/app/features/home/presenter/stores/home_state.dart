import 'package:tractian_challenge/app/features/home/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/tree_entity.dart';

class HomeState {
  final List<CompanyEntity> listCompanies;
  final List<TreeEntity> listTreeNode;
  final List<TreeEntity> listTreeNodeSearched;
  final String searchQuery;
  final bool typeAlertSelected;
  final bool typeSensorSelected;

  HomeState({
    required this.listCompanies,
    required this.listTreeNode,
    required this.listTreeNodeSearched,
    required this.searchQuery,
    required this.typeAlertSelected,
    required this.typeSensorSelected,
  });

  factory HomeState.init() => HomeState(
        listCompanies: [],
        listTreeNode: [],
        searchQuery: '',
        listTreeNodeSearched: [],
        typeAlertSelected: false,
        typeSensorSelected: false,
      );

  HomeState copyWith({
    List<CompanyEntity>? listCompanies,
    List<TreeEntity>? listTreeNode,
    List<TreeEntity>? listTreeNodeSearched,
    String? searchQuery,
    bool? typeAlertSelected,
    bool? typeSensorSelected,
  }) {
    return HomeState(
      listCompanies: listCompanies ?? this.listCompanies,
      listTreeNode: listTreeNode ?? this.listTreeNode,
      listTreeNodeSearched: listTreeNodeSearched ?? this.listTreeNodeSearched,
      searchQuery: searchQuery ?? this.searchQuery,
      typeAlertSelected: typeAlertSelected ?? this.typeAlertSelected,
      typeSensorSelected: typeSensorSelected ?? this.typeSensorSelected,
    );
  }

  HomeState emptyData() {
    return copyWith(
      listCompanies: listCompanies,
      listTreeNode: [],
      listTreeNodeSearched: [],
      searchQuery: '',
      typeAlertSelected: false,
      typeSensorSelected: false,
    );
  }
}
