import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tractian_challenge/app/core/failures/app_failure/app_failure.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/helpers/params/get_location_params.dart';
import '../../domain/respositories/i_get_location_repository.dart';
import '../../external/mappers/location_mapper.dart';
import '../datasources/i_get_location_datasource.dart';

class GetLocationRepository implements IGetLocationRepository {
  final IGetLocationDatasource _datasource;

  const GetLocationRepository(this._datasource);

  @override
  Future<Either<IAppFailure, List<LocationEntity>>> call(
      GetLocationParams params) async {
    try {
      final response = await _datasource(params);
      final listLocation = await compute(computeData, response);
      return Right(listLocation);
    } on TypeError catch (e) {
      return Left(AppFailure(message: 'Invalid JSON format: $e'));
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}

List<LocationEntity> computeData(List<Map<String, dynamic>> listMap) {
  return listMap.map((e) => LocationMapper.fromMap(e)).toList();
}
