import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/company_entity.dart';

abstract class IGetCompaniesUsecase {
  Future<Either<IAppFailure, List<CompanyEntity>>> call();
}
