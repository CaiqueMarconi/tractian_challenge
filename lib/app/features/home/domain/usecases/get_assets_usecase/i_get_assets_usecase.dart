import 'package:fpdart/fpdart.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/asset_entity.dart';
import '../../helpers/params/get_assets_params.dart';

abstract class IGetAssetsUsecase {
  Future<Either<IAppFailure, List<AssetEntity>>> call(GetAssetsParams params);
}
