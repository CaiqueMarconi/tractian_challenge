import 'package:model/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:model/app/core/shared/services/http_Service/helpers/responses/http_response.dart';
import 'package:model/app/features/home/domain/entities/item_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
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

  static final assetEntityMock = ItemEntity(
    id: '3',
    name: 'name',
    gatewayId: 'gatewayId',
    typeItem: TypeItemEnum.asset,
    parentId: '0',
  );

  static final treeEntityMock = TreeEntity(
    item: ItemEntity(
      id: '0',
      name: 'name',
      typeItem: TypeItemEnum.location,
    ),
    children: [assetEntityMock],
  );

  static final List<TreeEntity> listTreeMock = [
    treeEntityMock,
    TreeEntity(
      item: ItemEntity(
        id: '1',
        name: 'name',
        typeItem: TypeItemEnum.asset,
        parentId: '0',
      ),
      children: [
        ItemEntity(
          id: 'id',
          name: 'name',
          gatewayId: 'gatewayId',
          typeItem: TypeItemEnum.asset,
          parentId: '1',
        )
      ],
    ),
    TreeEntity(
      item: ItemEntity(
        id: '123',
        name: 'name',
        typeItem: TypeItemEnum.component,
        sensorType: 'sensorType',
      ),
      children: [],
    ),
    TreeEntity(
      item: ItemEntity(
        id: '2',
        name: 'name',
        typeItem: TypeItemEnum.location,
        locationId: '1',
      ),
      children: [
        ItemEntity(
          id: '1234',
          name: 'name',
          typeItem: TypeItemEnum.location,
          locationId: '2',
        )
      ],
    ),
  ];

  static final List<LocationEntity> listLocation = [
    LocationEntity(
      id: '1',
      name: 'name',
      locationChildren: [],
      typeItem: TypeItemEnum.location,
    ),
    LocationEntity(
      id: '2',
      name: 'name',
      locationChildren: [],
      typeItem: TypeItemEnum.location,
      parentId: '1',
    ),
    LocationEntity(
      id: '3',
      name: 'name',
      locationChildren: [],
      typeItem: TypeItemEnum.location,
    ),
  ];
}
