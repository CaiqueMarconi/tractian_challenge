import 'package:flutter_triple/flutter_triple.dart';
import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/entities/item_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';
import 'package:model/app/features/home/domain/usecases/generate_tree_node_usecase/i_generate_tree_node_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_assets_usecase/i_get_assets_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_companies_usecase/i_get_companies_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/i_get_location_usecase.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import 'home_state.dart';

final class HomeStore extends Store<HomeState> {
  final IGetLocationUsecase _getLocationUsecase;
  final IGetAssetsUsecase _getAssetsUsecase;
  final IGetCompaniesUsecase _getCompaniesUsecase;
  final IGenerateTreeNodeUsecase _generateTreeNodeUsecase;
  HomeStore({
    required IGetLocationUsecase getLocationUsecase,
    required IGetAssetsUsecase getAssetsUsecase,
    required IGetCompaniesUsecase getCompaniesUsecase,
    required IGenerateTreeNodeUsecase generateTreeNodeUsecase,
  })  : _getLocationUsecase = getLocationUsecase,
        _getAssetsUsecase = getAssetsUsecase,
        _getCompaniesUsecase = getCompaniesUsecase,
        _generateTreeNodeUsecase = generateTreeNodeUsecase,
        super(HomeState.init());

  // Get List Locations
  Future<void> getLocation(GetLocationParams params) async {
    final result = await _getLocationUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listLocation: r)),
    );
  }

  // Get List Assets
  Future<void> getAssets(GetAssetsParams params) async {
    final result = await _getAssetsUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listAssets: r)),
    );
  }

  // Get List Companies
  Future<void> getCompanies() async {
    final result = await _getCompaniesUsecase.call();
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listCompanies: r)),
    );
  }

  // Change value of TypeAsset variable
  void setTypeState(TypeStateEnum? typeState) {
    update(state.copyWith(typeAsset: typeState));
    applyFilter();
  }

  // Generate Tree Node
  void generateTreeNode() {
    final result = _generateTreeNodeUsecase.generate(
      listAssets: state.listAssets,
      listLocations: state.listLocation,
    );
    update(state.copyWith(listTreeNode: result));
  }

  Future<void> loadDataTreeNode(String companyId) async {
    setLoading(true);
    await getLocation(GetLocationParams(companyId: companyId));
    await getAssets(GetAssetsParams(companyId: companyId));
    generateTreeNode();
    final result = _generateTreeNodeUsecase.generate(
      listAssets: state.listAssets,
      listLocations: state.listLocation,
    );
    _listTreeNodeOriginal = result;
    update(state.copyWith(listTreeNode: result));
    setLoading(false);
  }

  List<TreeEntity> _listTreeNodeOriginal = [];

  void setSearchQuery(String query) {
    update(state.copyWith(searchQuery: query));
    applyFilter();
  }

  void applyFilter() {
    final filteredTree = filterTreeEntities(
      _listTreeNodeOriginal,
      state.searchQuery,
      state.typeAsset,
    );
    update(state.copyWith(listTreeNode: filteredTree));
  }

  List<TreeEntity> filterTreeEntities(
    List<TreeEntity> nodes,
    String query,
    TypeStateEnum? typeState,
  ) {
    return nodes
        .map((node) => filterTreeEntity(node, query, typeState))
        .where((node) => node != null)
        .cast<TreeEntity>()
        .toList();
  }

  TreeEntity? filterTreeEntity(
    TreeEntity node,
    String query,
    TypeStateEnum? typeState,
  ) {
    final matchesQuery =
        node.item.name.toLowerCase().contains(query.toLowerCase());
    final matchesTypeState = typeState == null || node.item.status == typeState;

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
        final filteredChild = filterTreeEntity(child, query, typeState);
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
}
