import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/failures/app_failure/i_app_failure.dart';
import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/respositories/i_get_assets_repository.dart';
import 'package:model/app/features/home/domain/usecases/get_assets_usecase/get_assets_usecase.dart';

import '../../mocks/app_failure_mock.dart';
import '../../mocks/home_mock.dart';

class Repository extends Mock implements IGetAssetsRepository {}

void main() {
  final repository = Repository();
  final usecase = GetAssetsUsecase(repository);
  test('Get assets usecase ...', () async {
    when(() => repository.call(HomeMock.getAssetsParam))
        .thenAnswer((invocation) async => const Right([]));
    final result = await usecase.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<List<AssetEntity>>());
  });

  test('Get assets failure...', () async {
    when(() => repository.call(HomeMock.getAssetsParam))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
