import 'package:model/app/features/home/domain/entities/company_entity.dart';

abstract class IGetCompaniesDatasource {
  Future<List<CompanyEntity>> call();
}
