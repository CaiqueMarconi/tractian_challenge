import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/failures/app_failure/i_app_failure.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/respositories/i_get_location_repository.dart';
import 'package:model/app/features/home/domain/usecases/get_location_usecase/get_location_usecase.dart';

import '../../mocks/app_failure_mock.dart';
import '../../mocks/home_mock.dart';

class Repository extends Mock implements IGetLocationRepository {}

void main() {
  final repository = Repository();
  final usecase = GetLocationUsecase(repository);
  test('Get location usecase ...', () async {
    when(() => repository.call(HomeMock.getLocationParamMock))
        .thenAnswer((invocation) async => const Right([]));
    final result = await usecase.call(HomeMock.getLocationParamMock);
    expect(result.fold((l) => l, (r) => r), isA<List<LocationEntity>>());
  });

  test('Get location failure...', () async {
    when(() => repository.call(HomeMock.getLocationParamMock))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(HomeMock.getLocationParamMock);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
