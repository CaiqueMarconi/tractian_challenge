import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/entities/companie_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';

import '../../domain/helpers/params/get_assets_params.dart';
import '../stores/home_store.dart';

class HomeController {
  final HomeStore _homeStore;

  HomeController({
    required HomeStore homeStore,
  }) : _homeStore = homeStore;

  // GETTERS VARIABLES
  List<LocationEntity> get listLocation => _homeStore.state.listLocation;
  List<AssetEntity> get listAssets => _homeStore.state.listAssets;
  List<CompanyEntity> get listCompanies => _homeStore.state.listCompanies;
  TypeStateEnum? get typeState => _homeStore.state.typeAsset;

  // GETTERS STORES
  HomeStore get homeStore => _homeStore;

  Future<void> getLocation(String companyId) async {
    await _homeStore.getLocation(
      GetLocationParams(companyId: companyId),
    );
  }

  Future<void> getAssets() async {
    await _homeStore.getAssets(
      GetAssetsParams(companyid: '662fd0ee639069143a8fc387'),
    );
  }

  Future<void> getCompanies() async {
    await _homeStore.getCompanies();
  }

  void setTypeState(TypeStateEnum typeStateSelected) {
    if (typeState == typeStateSelected) {
      _homeStore.setTypeState(null);
    } else {
      _homeStore.setTypeState(typeStateSelected);
    }
  }
}
