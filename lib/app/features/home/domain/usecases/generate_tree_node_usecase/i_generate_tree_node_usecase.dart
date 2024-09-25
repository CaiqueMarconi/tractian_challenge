import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';

import '../../entities/asset_entity.dart';

abstract class IGenerateTreeNodeUsecase {
  List<TreeEntity> generate({
    required List<AssetEntity> listAssets,
    required List<LocationEntity> listLocations,
  });
}
