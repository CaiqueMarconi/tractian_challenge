import 'package:flutter_triple/flutter_triple.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/i_get_location_usecase.dart';

import 'home_state.dart';

final class HomeStore extends Store<HomeState> {
  final IGetLocationUsecase _getLocationUsecase;
  HomeStore({
    required IGetLocationUsecase getLocationUsecase,
  })  : _getLocationUsecase = getLocationUsecase,
        super(HomeState.init());

  Future<void> getLocation(GetLocationParams params) async {
    final result = await _getLocationUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listLocation: r)),
    );
  }
}
