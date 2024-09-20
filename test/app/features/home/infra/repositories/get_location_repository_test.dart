import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:saga_home/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:saga_home/app/features/home/infra/datasources/i_get_location_datasource.dart';
import 'package:saga_home/app/features/home/infra/repositories/get_location_repository.dart';

import '../../../../mocks/app_failure_mock.dart';

class _DatasourceMock extends Mock implements IGetLocationDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetLocationRepository(datasource);
  test('Get location repository ...', () async {
    when(() => datasource.call(I))
        .thenAnswer((_) async => unit);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Get location repository failure...', () async {
    when(() => datasource.call(i))
        .thenThrow(appFailureMock);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
