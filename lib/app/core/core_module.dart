import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/http_Service/http_service.dart';
import 'shared/services/http_Service/i_http_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addLazySingleton((i) => Dio());
    i.add<IHttpService>(HttpService.new);
  }
}
