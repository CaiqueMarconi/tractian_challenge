import 'package:tractian_challenge/app/core/shared/services/http_Service/helpers/params/http_param.dart';

import 'helpers/responses/http_response.dart';

abstract class IHttpService {
  Future<HttpResponse> get(HttpParam param);
}
