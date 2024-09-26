import 'package:tractian_challenge/app/core/shared/services/http_Service/i_http_service.dart';

import '../../../../core/shared/services/http_Service/helpers/params/http_param.dart';
import '../../domain/helpers/params/get_assets_params.dart';
import '../../infra/datasources/i_get_assets_datasource.dart';

class GetAssetsDatasource implements IGetAssetsDatasource {
  final IHttpService _httpService;

  GetAssetsDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> call(GetAssetsParams params) async {
    final result = await _httpService.get(
      HttpParam(
        url:
            'https://fake-api.tractian.com/companies/${params.companyId}/assets',
      ),
    );
    final List<Map<String, dynamic>> typedListData =
        result.response.map((item) => item as Map<String, dynamic>).toList();

    return typedListData;
  }
}
