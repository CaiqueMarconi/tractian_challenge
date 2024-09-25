import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';

import '../../domain/entities/asset_entity.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import '../stores/home_store.dart';

class HomeController {
  final HomeStore _homeStore;

  HomeController({
    required HomeStore homeStore,
  }) : _homeStore = homeStore;

  // GETTERS VARIABLES
  List<LocationEntity> get listLocation => _homeStore.state.listLocation;
  List<TreeEntity> get listAssets => _homeStore.state.listAssets;
  List<CompanyEntity> get listCompanies => _homeStore.state.listCompanies;
  bool get typeSensorSelected => _homeStore.state.typeSensorSelected;
  bool get typeAlertSelected => _homeStore.state.typeAlertSelected;
  List<TreeEntity> get listTreeNode => _homeStore.state.listTreeNode;
  List<TreeEntity> get listTreeNodeSearched =>
      _homeStore.state.listTreeNodeSearched;

  // GETTERS STORES
  HomeStore get homeStore => _homeStore;

  Future<void> getLocation(String companyId) async {
    await _homeStore.getLocation(
      GetLocationParams(companyId: companyId),
    );
  }

  Future<void> getAssets(String companyId) async {
    await _homeStore.getAssets(
      GetAssetsParams(companyId: companyId),
    );
  }

  Future<void> getCompanies() async {
    await _homeStore.getCompanies();
  }

  void setTypeState(TypeStateEnum typeStateSelected) {
    if (TypeStateEnum.sensor == typeStateSelected) {
      _homeStore.setSensorSelected();
    } else {
      _homeStore.setAlertSelected();
    }
    applyFilter();
  }

  Future<void> generateTreeNode(String companyId) async {
    await homeStore.loadDataTreeNode(companyId);
  }

  void applyFilter() {
    final filteredTree = filterTreeEntities(
      listTreeNodeSearched,
      homeStore.state.searchQuery,
    );
    homeStore.setListTreeNode(filteredTree);
  }

  void setListTreeNodeEmpty() {
    homeStore.setListTreeNode([]);
  }

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
      } else if (child is AssetEntity ||
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
