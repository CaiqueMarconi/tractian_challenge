import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:saga_home/app/core/shared/services/http_service/i_http_service.dart';
import 'package:saga_home/app/features/{{module}}/external/datasources/{{name.snakeCase()}}_datasource.dart';


class IHttpTTLockServiceMock extends Mock implements IHttpTTLockService {}

void main() {
  final iHttpTTLockService = IHttpTTLockServiceMock();
  final datasource = {{name.pascalCase()}}Datasource(iHttpTTLockService: iHttpTTLockService);

 
  test('{{name.sentenceCase()}} datasource ...', () async {
    when(() => iHttpTTLockService.get()).thenAnswer(
      (invocation) async => i,
    );
    final result = await datasource.call(i);
    expect(result, isA<Unit>());
  });
}
