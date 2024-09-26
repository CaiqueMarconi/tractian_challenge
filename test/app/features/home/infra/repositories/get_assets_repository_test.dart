import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/failures/app_failure/i_app_failure.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/infra/datasources/i_get_assets_datasource.dart';
import 'package:model/app/features/home/infra/repositories/get_assets_repository.dart';

import '../../mocks/app_failure_mock.dart';
import '../../mocks/home_mock.dart';

class _DatasourceMock extends Mock implements IGetAssetsDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetAssetsRepository(datasource);
  test('Get assets repository ...', () async {
    when(() => datasource.call(HomeMock.getAssetsParam))
        .thenAnswer((_) async => []);
    final result = await repository.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<List<TreeEntity>>());
  });

  test('Get assets repository failure...', () async {
    when(() => datasource.call(HomeMock.getAssetsParam))
        .thenThrow(appFailureMock);
    final result = await repository.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
