import '../../domain/entities/companie_entity.dart';

class CompanieMapper {
  static CompanyEntity fromMap(Map<String, dynamic> map) {
    return CompanyEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
