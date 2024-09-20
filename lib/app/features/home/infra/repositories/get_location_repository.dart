import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../../domain/helpers/params/get_location_params.dart';
import '../../domain/respositories/i_get_location_repository.dart';
import '../datasources/i_get_location_datasource.dart';

class GetLocationRepository implements IGetLocationRepository {
  final IGetLocationDatasource _datasource;

  const GetLocationRepository(this._datasource);

  @override
  Future<Either<IAppFailure, List<Map<String, dynamic>>>> call(
      GetLocationParams params) async {
    try {
      final response = await _datasource(params);
      return Right(response);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
