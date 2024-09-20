import 'package:flutter_modular/flutter_modular.dart';
import 'package:model/app/core/core_module.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/get_location_usecase.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/i_get_location_usecase.dart';
import 'package:model/app/features/home/external/datasources/get_location_datasource.dart';
import 'package:model/app/features/home/infra/repositories/get_location_repository.dart';
import 'package:model/app/features/home/presenter/controllers/home_controller.dart';
import 'package:model/app/features/home/presenter/pages/home_page.dart';
import 'package:model/app/features/home/presenter/stores/home_store.dart';

import 'domain/respositories/i_get_location_repository.dart';
import 'infra/datasources/i_get_location_datasource.dart';

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
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (_) => HomePage(
        homeController: Modular.get<HomeController>(),
      ),
    );
  }
}
