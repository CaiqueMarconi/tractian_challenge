import '../../domain/entities/companie_entity.dart';

abstract class IGetCompaniesDatasource {
  Future<List<CompanyEntity>> call();
}
