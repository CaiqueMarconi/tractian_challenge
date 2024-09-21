import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/companie_entity.dart';
import '../../helpers/params/get_companies_params.dart';

abstract class IGetCompaniesUsecase {
  Future<Either<IAppFailure, List<CompanyEntity>>> call();
}
