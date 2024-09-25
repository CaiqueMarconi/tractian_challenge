import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:model/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:model/app/core/shared/services/http_Service/i_http_service.dart';
import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/external/datasources/get_companies_datasource.dart';

import '../../mocks/home_mock.dart';

class IHttpServiceMock extends Mock implements IHttpService {}

class HttpParamFake extends Fake implements HttpParam {}

void main() {
  final iHttpService = IHttpServiceMock();
  final datasource = GetCompaniesDatasource(httpService: iHttpService);

  setUpAll(() {
    registerFallbackValue(HttpParamFake());
  });

  test('Get companies datasource ...', () async {
    when(() => iHttpService.get(any())).thenAnswer(
      (invocation) async => HomeMock.httpResponse,
    );
    final result = await datasource.call();
    expect(result, isA<List<CompanyEntity>>());
  });
}
