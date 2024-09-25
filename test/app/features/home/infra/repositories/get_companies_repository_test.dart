import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/failures/app_failure/i_app_failure.dart';
import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/infra/datasources/i_get_companies_datasource.dart';
import 'package:model/app/features/home/infra/repositories/get_companies_repository.dart';

import '../../mocks/app_failure_mock.dart';

class _DatasourceMock extends Mock implements IGetCompaniesDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetCompaniesRepository(datasource);
  test('Get companies repository ...', () async {
    when(() => datasource.call()).thenAnswer((_) async => []);
    final result = await repository.call();
    expect(result.fold((l) => l, (r) => r), isA<List<CompanyEntity>>());
  });

  test('Get companies repository failure...', () async {
    when(() => datasource.call()).thenThrow(appFailureMock);
    final result = await repository.call();
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
