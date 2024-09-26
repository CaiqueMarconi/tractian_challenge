import 'package:tractian_challenge/app/features/home/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/location_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/tree_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/helpers/enums/type_state_enum.dart';
import '../../../../core/shared/methods/error_notifier.dart';
import '../../domain/entities/item_entity.dart';
import '../stores/home_store.dart';

class HomeController {
  final HomeStore _homeStore;

  HomeController({
    required HomeStore homeStore,
  }) : _homeStore = homeStore;

  // GETTERS VARIABLES
  List<CompanyEntity> get listCompanies => _homeStore.state.listCompanies;
  bool get typeSensorSelected => _homeStore.state.typeSensorSelected;
  bool get typeAlertSelected => _homeStore.state.typeAlertSelected;
  List<TreeEntity> get listTreeNode => _homeStore.state.listTreeNode;
  List<TreeEntity> get listTreeNodeSearched =>
      _homeStore.state.listTreeNodeSearched;

  // GETTERS STORES
  HomeStore get homeStore => _homeStore;

  // get the companies
  Future<void> getCompanies() async {
    await _homeStore.getCompanies();
    if (ErrorNotifier.displayErrorIfExists(store: homeStore)) return;
  }

  // method that load the tree node
  Future<void> generateTreeNode(String companyId) async {
    await homeStore.generateTreeNode(companyId);

    if (ErrorNotifier.displayErrorIfExists(store: homeStore)) return;
  }

  // Applies the filter based on the search query and updates the home store with the filtered results.
  void applyFilter() {
    final filteredTree = filterTreeEntities(
      listTreeNodeSearched,
      homeStore.state.searchQuery,
    );
    homeStore.setListTreeNode(filteredTree);
  }

  // Clears the current data in the home store.
  void setEmptyData() {
    homeStore.setEmptyData();
  }

  // Filters the list of tree entities based on the search query and returns the filtered list.
  List<TreeEntity> filterTreeEntities(
    List<TreeEntity> nodes,
    String query,
  ) {
    return nodes
        .map((node) => filterTreeEntity(node, query))
        .where((node) => node != null)
        .cast<TreeEntity>()
        .toList();
  }

  // Filters a single tree entity and its children based on the search query and type state.
  // Returns the entity if it matches, otherwise returns null.
  TreeEntity? filterTreeEntity(
    TreeEntity node,
    String query,
  ) {
    final matchesQuery =
        node.item.name.toLowerCase().contains(query.toLowerCase());
    TypeStateEnum? typeState;

    if (typeAlertSelected == true) {
      typeState = TypeStateEnum.critical;
    } else if (typeSensorSelected == true) {
      typeState = TypeStateEnum.sensor;
    }
    bool matchesTypeState = true;
    if (typeState != null) {
      matchesTypeState = node.item.status == typeState;
    }

    final filteredChildren = filterDynamicChildren(
      node.children,
      query,
      typeState,
    );

    if ((matchesQuery && matchesTypeState) || filteredChildren.isNotEmpty) {
      return node.copyWith(children: filteredChildren);
    } else {
      return null;
    }
  }

  // Filters the dynamic children of a node (either tree entities or other entities) based on the query and type state.
  List<dynamic> filterDynamicChildren(
    List<dynamic> children,
    String query,
    TypeStateEnum? typeState,
  ) {
    final filteredChildren = <dynamic>[];

    for (var child in children) {
      if (child is TreeEntity) {
        final filteredChild = filterTreeEntity(child, query);
        if (filteredChild != null) {
          filteredChildren.add(filteredChild);
        }
      } else if (child is ItemEntity ||
          child is LocationEntity ||
          child is ItemEntity) {
        final matchesQuery =
            child.name.toLowerCase().contains(query.toLowerCase());
        final matchesTypeState = typeState == null || child.status == typeState;

        if (matchesQuery && matchesTypeState) {
          filteredChildren.add(child);
        }
      }
    }

    return filteredChildren;
  }

  void setSearchQuery(String searchQuery) {
    homeStore.setSearchQuery(searchQuery);
    applyFilter();
  }

  void setSensorSelected() {
    homeStore.setSensorSelected();
    applyFilter();
  }

  void setAlertSelected() {
    homeStore.setAlertSelected();
    applyFilter();
  }
}
