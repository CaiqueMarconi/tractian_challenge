import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:model/app/features/home/external/mappers/asset_mapper.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/asset_entity.dart';
import '../../helpers/params/get_assets_params.dart';
import '../../respositories/i_get_assets_repository.dart';
import 'i_get_assets_usecase.dart';

class GetAssetsUsecase implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  const GetAssetsUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<AssetEntity>>> call(
      GetAssetsParams params) async {
    final responseData = await _repository.call(params);

    final result = responseData.fold((l) => l, (r) => r);

    if (result is IAppFailure) return Left(result);

    final listMap = result as List<Map<String, dynamic>>;
    final listAssets = await compute(computeData, listMap);
    final listAssetsParent =
        listAssets.where((element) => element.parentId == null).toList();
    final listAssetsChildren =
        listAssets.where((element) => element.parentId != null).toList();
    for (var i = 0; i < listAssetsParent.length; i++) {
      final childrens = listAssetsChildren
          .where((element) => element.parentId == listAssetsParent[i].id)
          .toList();
      listAssetsParent[i] = listAssetsParent[i].copyWith(
        listChildren: childrens,
      );
    }

    return Right(listAssetsParent);
  }
}

List<AssetEntity> computeData(List<Map<String, dynamic>> listMap) {
  return listMap.map((e) => AssetMapper.fromMap(e)).toList();
}
