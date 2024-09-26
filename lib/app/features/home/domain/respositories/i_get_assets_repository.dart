import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../entities/tree_entity.dart';
import '../helpers/params/get_assets_params.dart';

abstract class IGetAssetsRepository {
  Future<Either<IAppFailure, List<TreeEntity>>> call(GetAssetsParams params);
}
