import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:tractian_challenge/app/core/shared/services/http_Service/i_http_service.dart';
import 'package:tractian_challenge/app/features/home/external/datasources/get_assets_datasource.dart';

import '../../mocks/home_mock.dart';

class IHttpServiceMock extends Mock implements IHttpService {}

class HttpParamFake extends Fake implements HttpParam {}

void main() {
  final iHttpTTLockService = IHttpServiceMock();
  final datasource = GetAssetsDatasource(httpService: iHttpTTLockService);

  setUpAll(() {
    registerFallbackValue(HttpParamFake());
  });

  test('Get assets datasource ...', () async {
    when(() => iHttpTTLockService.get(any())).thenAnswer(
      (invocation) async => HomeMock.httpResponse,
    );
    final result = await datasource.call(HomeMock.getAssetsParam);
    expect(result, isA<List<Map<String, dynamic>>>());
  });
}
