import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/app/core/failures/app_failure/i_app_failure.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/tree_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/respositories/i_get_assets_repository.dart';
import 'package:tractian_challenge/app/features/home/domain/usecases/get_assets_usecase/get_assets_usecase.dart';

import '../../mocks/app_failure_mock.dart';
import '../../mocks/home_mock.dart';

class Repository extends Mock implements IGetAssetsRepository {}

void main() {
  final repository = Repository();
  final usecase = GetAssetsUsecase(repository);
  test('Get assets usecase ...', () async {
    when(() => repository.call(HomeMock.getAssetsParam))
        .thenAnswer((invocation) async => Right(HomeMock.listTreeMock));
    final result = await usecase.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<List<TreeEntity>>());
  });

  test('Get assets failure...', () async {
    when(() => repository.call(HomeMock.getAssetsParam))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(HomeMock.getAssetsParam);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
