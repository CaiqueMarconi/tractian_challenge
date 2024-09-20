import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:saga_home/app/core/shared/services/http_service/i_http_service.dart';
import 'package:saga_home/app/features/home/external/datasources/get_location_datasource.dart';


class IHttpTTLockServiceMock extends Mock implements IHttpTTLockService {}

void main() {
  final iHttpTTLockService = IHttpTTLockServiceMock();
  final datasource = GetLocationDatasource(iHttpTTLockService: iHttpTTLockService);

 
  test('Get location datasource ...', () async {
    when(() => iHttpTTLockService.get()).thenAnswer(
      (invocation) async => i,
    );
    final result = await datasource.call(i);
    expect(result, isA<Unit>());
  });
}
