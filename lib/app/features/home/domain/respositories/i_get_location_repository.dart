import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../entities/location_entity.dart';
import '../helpers/params/get_location_params.dart';

abstract class IGetLocationRepository {
  Future<Either<IAppFailure, List<LocationEntity>>> call(
      GetLocationParams params);
}
