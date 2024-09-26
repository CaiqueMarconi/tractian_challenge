import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:model/app/core/failures/app_failure/app_failure.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../../domain/entities/tree_entity.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import '../../domain/respositories/i_get_assets_repository.dart';
import '../../external/mappers/tree_mapper.dart';
import '../datasources/i_get_assets_datasource.dart';

class GetAssetsRepository implements IGetAssetsRepository {
  final IGetAssetsDatasource _datasource;

  const GetAssetsRepository(this._datasource);

  @override
  Future<Either<IAppFailure, List<TreeEntity>>> call(
      GetAssetsParams params) async {
    try {
      final response = await _datasource(params);
      final listAssets = await compute(computeData, response);

      return Right(listAssets);
    } on TypeError catch (e) {
      return Left(AppFailure(message: 'Invalid JSON format: $e'));
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}

List<TreeEntity> computeData(List<Map<String, dynamic>> listMap) {
  return listMap.map((e) => TreeMapper.fromMap(e)).toList();
}
