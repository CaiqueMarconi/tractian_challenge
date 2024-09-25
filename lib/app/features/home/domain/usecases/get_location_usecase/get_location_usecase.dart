import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';
import 'package:model/app/features/home/external/mappers/location_mapper.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../respositories/i_get_location_repository.dart';
import 'i_get_location_usecase.dart';

class GetLocationUsecase implements IGetLocationUsecase {
  final IGetLocationRepository _repository;

  const GetLocationUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<LocationEntity>>> call(
      GetLocationParams params) async {
    final responseData = await _repository.call(params);

    final result = responseData.fold((l) => l, (r) => r);

    if (result is IAppFailure) return Left(result);

    final listMap = result as List<Map<String, dynamic>>;
    final listLocation = await compute(computeData, listMap);
    final listLocationParent =
        listLocation.where((element) => element.parentId == null).toList();
    final listLocationChildren =
        listLocation.where((element) => element.parentId != null).toList();

    // adiciona location filhos a outros locations filho
    for (var i = 0; i < listLocationChildren.length; i++) {
      final childrens = listLocationChildren
          .where((element) => element.parentId == listLocationChildren[i].id)
          .toList();
      listLocationChildren[i] = listLocationChildren[i].copyWith(
        locationChildren: childrens,
      );
    }

    // adiciona location filhos a outros locations pai
    for (var i = 0; i < listLocationParent.length; i++) {
      final childrens = listLocationChildren
          .where((element) => element.parentId == listLocationParent[i].id)
          .toList();
      listLocationParent[i] = listLocationParent[i].copyWith(
        locationChildren: childrens,
      );
    }

    return Right(listLocationParent);
  }
}

List<LocationEntity> computeData(List<Map<String, dynamic>> listMap) {
  return listMap.map((e) => LocationMapper.fromMap(e)).toList();
}
