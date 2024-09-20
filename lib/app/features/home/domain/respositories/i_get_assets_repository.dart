import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../helpers/params/get_assets_params.dart';

abstract class IGetAssetsRepository {
  Future<Either<IAppFailure, List<Map<String, dynamic>>>> call(
      GetAssetsParams params);
}
