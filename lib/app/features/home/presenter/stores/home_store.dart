import 'package:flutter_triple/flutter_triple.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/usecases/generate_tree_node_usecase/i_generate_tree_node_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_companies_usecase/i_get_companies_usecase.dart';
import 'home_state.dart';

final class HomeStore extends Store<HomeState> {
  final IGetCompaniesUsecase _getCompaniesUsecase;
  final IGenerateTreeNodeUsecase _generateTreeNodeUsecase;
  HomeStore({
    required IGetCompaniesUsecase getCompaniesUsecase,
    required IGenerateTreeNodeUsecase generateTreeNodeUsecase,
  })  : _getCompaniesUsecase = getCompaniesUsecase,
        _generateTreeNodeUsecase = generateTreeNodeUsecase,
        super(HomeState.init());

  // Get List Companies
  Future<void> getCompanies() async {
    final result = await _getCompaniesUsecase.call();
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listCompanies: r)),
    );
  }

  // Change value of TypeAsset variable
  void setSensorSelected() {
    update(
      state.copyWith(
        typeSensorSelected: !state.typeSensorSelected,
        typeAlertSelected: false,
      ),
    );
  }

  // Change value of TypeAsset variable
  void setAlertSelected() {
    update(
      state.copyWith(
        typeSensorSelected: false,
        typeAlertSelected: !state.typeAlertSelected,
      ),
    );
  }

  // perform as requests of Assets and Location to Generate Tree Node
  Future<void> generateTreeNode(String companyId) async {
    setLoading(true);
    try {
      final result = await _generateTreeNodeUsecase.generate(
        companyId: companyId,
      );
      update(state.copyWith(
        listTreeNode: result,
        listTreeNodeSearched: result,
      ));
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  // change the value of listTreeNode variable
  void setListTreeNode(List<TreeEntity> listTreeNode) {
    update(state.copyWith(listTreeNode: listTreeNode));
  }

  // change the value of searchQuery variable
  void setSearchQuery(String query) {
    update(state.copyWith(searchQuery: query));
  }

  // set how empty the variables that not necessary in home header page
  void setEmptyData() {
    update(state.emptyData());
  }
}
