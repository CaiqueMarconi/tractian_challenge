import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import '../../domain/respositories/i_get_assets_repository.dart';
import '../datasources/i_get_assets_datasource.dart';

class GetAssetsRepository implements IGetAssetsRepository {
  final IGetAssetsDatasource _datasource;

  const GetAssetsRepository(this._datasource);

  @override
  Future<Either<IAppFailure, List<Map<String, dynamic>>>> call(
      GetAssetsParams params) async {
    try {
      final response = await _datasource(params);

      return Right(response);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
