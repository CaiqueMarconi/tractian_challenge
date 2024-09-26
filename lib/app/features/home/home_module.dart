import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_challenge/app/core/core_module.dart';
import 'package:tractian_challenge/app/features/home/domain/usecases/generate_tree_node_usecase/generate_tree_node_usecase.dart';
import 'package:tractian_challenge/app/features/home/domain/usecases/get_location_usecase/get_location_usecase.dart';
import 'package:tractian_challenge/app/features/home/domain/usecases/get_location_usecase/i_get_location_usecase.dart';
import 'package:tractian_challenge/app/features/home/external/datasources/get_location_datasource.dart';
import 'package:tractian_challenge/app/features/home/infra/repositories/get_location_repository.dart';
import 'package:tractian_challenge/app/features/home/presenter/controllers/home_controller.dart';
import 'package:tractian_challenge/app/features/home/presenter/pages/home_header.dart';
import 'package:tractian_challenge/app/features/home/presenter/pages/home_page.dart';
import 'package:tractian_challenge/app/features/home/presenter/stores/home_store.dart';

import 'domain/respositories/i_get_assets_repository.dart';
import 'domain/respositories/i_get_companies_repository.dart';
import 'domain/respositories/i_get_location_repository.dart';
import 'domain/usecases/generate_tree_node_usecase/i_generate_tree_node_usecase.dart';
import 'domain/usecases/get_assets_usecase/get_assets_usecase.dart';
import 'domain/usecases/get_assets_usecase/i_get_assets_usecase.dart';
import 'domain/usecases/get_companies_usecase/get_companies_usecase.dart';
import 'domain/usecases/get_companies_usecase/i_get_companies_usecase.dart';
import 'external/datasources/get_assets_datasource.dart';
import 'external/datasources/get_companies_datasource.dart';
import 'infra/datasources/i_get_assets_datasource.dart';
import 'infra/datasources/i_get_companies_datasource.dart';
import 'infra/datasources/i_get_location_datasource.dart';
import 'infra/repositories/get_assets_repository.dart';
import 'infra/repositories/get_companies_repository.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    super.binds(i);

    // CONTROLLERS
    i.addLazySingleton(HomeController.new);

    // STORES
    i.addLazySingleton(HomeStore.new);

    // Get Location
    i.addLazySingleton<IGetLocationUsecase>(GetLocationUsecase.new);
    i.addLazySingleton<IGetLocationRepository>(GetLocationRepository.new);
    i.addLazySingleton<IGetLocationDatasource>(GetLocationDatasource.new);

    // Get Assets
    i.addLazySingleton<IGetAssetsUsecase>(GetAssetsUsecase.new);
    i.addLazySingleton<IGetAssetsRepository>(GetAssetsRepository.new);
    i.addLazySingleton<IGetAssetsDatasource>(GetAssetsDatasource.new);

    // Get Companies
    i.addLazySingleton<IGetCompaniesUsecase>(GetCompaniesUsecase.new);
    i.addLazySingleton<IGetCompaniesRepository>(GetCompaniesRepository.new);
    i.addLazySingleton<IGetCompaniesDatasource>(GetCompaniesDatasource.new);

    // Generate tree node
    i.addLazySingleton<IGenerateTreeNodeUsecase>(GenerateTreeNodeUsecase.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (_) => HomeHeader(
        homeController: Modular.get<HomeController>(),
      ),
    );
    r.child(
      '/home',
      child: (_) => HomePage(
        homeController: Modular.get<HomeController>(),
        company: r.args.data['company'],
      ),
    );
  }
}
