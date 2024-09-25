import 'package:model/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:model/app/core/shared/services/http_Service/helpers/responses/http_response.dart';
import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/helpers/params/get_assets_params.dart';
import 'package:model/app/features/home/domain/helpers/params/get_location_params.dart';

class HomeMock {
  static final getLocationParamMock = GetLocationParams(companyId: '');

  static final httpParamMock = HttpParam(url: '');

  static final httpResponse = HttpResponse(response: [
    {
      "id": "656a07bbf2d4a1001e2144c2",
      "name": "CONVEYOR BELT ASSEMBLY",
      "locationId": "656a07b3f2d4a1001e2144bf"
    }
  ]);

  static final getAssetsParam = GetAssetsParams(companyId: '');

  static final assetEntityMock = AssetEntity(
    id: 'id',
    name: 'name',
    status: 'status',
    gatewayId: 'gatewayId',
    children: [],
  );
}
