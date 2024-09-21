import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/failures/app_failure/i_app_failure.dart';
import 'package:model/app/features/home/domain/entities/companie_entity.dart';
import 'package:model/app/features/home/domain/respositories/i_get_companies_repository.dart';
import 'package:model/app/features/home/domain/usecases/get_companies_usecase/get_companies_usecase.dart';

import '../../mocks/app_failure_mock.dart';

class Repository extends Mock implements IGetCompaniesRepository {}

void main() {
  final repository = Repository();
  final usecase = GetCompaniesUsecase(repository);
  test('Get companies usecase ...', () async {
    when(() => repository.call())
        .thenAnswer((invocation) async => const Right([]));
    final result = await usecase.call();
    expect(result.fold((l) => l, (r) => r), isA<List<CompanyEntity>>());
  });

  test('Get companies failure...', () async {
    when(() => repository.call())
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call();
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
