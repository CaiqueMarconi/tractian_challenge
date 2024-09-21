import 'package:fpdart/fpdart.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/companie_entity.dart';
import '../../respositories/i_get_companies_repository.dart';
import 'i_get_companies_usecase.dart';

class GetCompaniesUsecase implements IGetCompaniesUsecase {
  final IGetCompaniesRepository _repository;

  const GetCompaniesUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<CompanyEntity>>> call() async {
    return await _repository();
  }
}
