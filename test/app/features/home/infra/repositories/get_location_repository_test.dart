import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/app/core/failures/app_failure/i_app_failure.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/location_entity.dart';
import 'package:tractian_challenge/app/features/home/infra/datasources/i_get_location_datasource.dart';
import 'package:tractian_challenge/app/features/home/infra/repositories/get_location_repository.dart';

import '../../mocks/app_failure_mock.dart';
import '../../mocks/home_mock.dart';

class _DatasourceMock extends Mock implements IGetLocationDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetLocationRepository(datasource);
  test('Get location repository ...', () async {
    when(() => datasource.call(HomeMock.getLocationParamMock))
        .thenAnswer((_) async => []);
    final result = await repository.call(HomeMock.getLocationParamMock);
    expect(result.fold((l) => l, (r) => r), isA<List<LocationEntity>>());
  });

  test('Get location repository failure...', () async {
    when(() => datasource.call(HomeMock.getLocationParamMock))
        .thenThrow(appFailureMock);
    final result = await repository.call(HomeMock.getLocationParamMock);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
