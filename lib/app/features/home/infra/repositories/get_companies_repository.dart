import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/app_failure/i_app_failure.dart';
import '../../domain/entities/companie_entity.dart';
import '../../domain/respositories/i_get_companies_repository.dart';
import '../datasources/i_get_companies_datasource.dart';

class GetCompaniesRepository implements IGetCompaniesRepository {
  final IGetCompaniesDatasource _datasource;

  const GetCompaniesRepository(this._datasource);

  @override
  Future<Either<IAppFailure, List<CompanyEntity>>> call() async {
    try {
      final response = await _datasource();

      return Right(response);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
