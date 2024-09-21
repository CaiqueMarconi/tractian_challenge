import 'package:flutter_triple/flutter_triple.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';
import 'package:model/app/features/home/domain/usecases/get_assets_usecase/i_get_assets_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_companies_usecase/i_get_companies_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/i_get_location_usecase.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import 'home_state.dart';

final class HomeStore extends Store<HomeState> {
  final IGetLocationUsecase _getLocationUsecase;
  final IGetAssetsUsecase _getAssetsUsecase;
  final IGetCompaniesUsecase _getCompaniesUsecase;
  HomeStore({
    required IGetLocationUsecase getLocationUsecase,
    required IGetAssetsUsecase getAssetsUsecase,
    required IGetCompaniesUsecase getCompaniesUsecase,
  })  : _getLocationUsecase = getLocationUsecase,
        _getAssetsUsecase = getAssetsUsecase,
        _getCompaniesUsecase = getCompaniesUsecase,
        super(HomeState.init());

  Future<void> getLocation(GetLocationParams params) async {
    setLoading(true);
    final result = await _getLocationUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listLocation: r)),
    );
    setLoading(false);
  }

  Future<void> getAssets(GetAssetsParams params) async {
    final result = await _getAssetsUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listAssets: r)),
    );
  }

  Future<void> getCompanies() async {
    final result = await _getCompaniesUsecase.call();
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listCompanies: r)),
    );
  }

  void setTypeState(TypeStateEnum? typeState) {
    update(state.copyWith(typeAsset: typeState));
  }
}
