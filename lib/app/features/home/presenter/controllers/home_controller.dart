import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';

import '../stores/home_store.dart';

class HomeController {
  final HomeStore _homeStore;

  HomeController({
    required HomeStore homeStore,
  }) : _homeStore = homeStore;

  Future<void> getLocation() async {
    await _homeStore.getLocation(
      GetLocationParams(companyId: '662fd0fab3fd5656edb39af5'),
    );
  }
}
