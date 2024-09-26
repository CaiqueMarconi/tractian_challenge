import 'package:tractian_challenge/app/features/home/domain/entities/company_entity.dart';

abstract class IGetCompaniesDatasource {
  Future<List<CompanyEntity>> call();
}
