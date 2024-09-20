import 'package:model/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:model/app/core/shared/services/http_Service/i_http_service.dart';

import '../../domain/helpers/params/get_location_params.dart';
import '../../infra/datasources/i_get_location_datasource.dart';

class GetLocationDatasource implements IGetLocationDatasource {
  final IHttpService _httpService;

  GetLocationDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> call(GetLocationParams params) async {
    final result = await _httpService.get(
      HttpParam(
        url:
            'https://fake-api.tractian.com/companies/662fd0fab3fd5656edb39af5/locations',
      ),
    );
    final List<Map<String, dynamic>> typedListData =
        result.response.map((item) => item as Map<String, dynamic>).toList();

    return typedListData;
  }
}
