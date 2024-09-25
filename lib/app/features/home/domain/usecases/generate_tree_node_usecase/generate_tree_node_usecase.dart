import 'package:model/app/features/home/domain/entities/asset_entity.dart';
import 'package:model/app/features/home/domain/entities/item_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
import 'package:model/app/features/home/domain/usecases/generate_tree_node_usecase/i_generate_tree_node_usecase.dart';

class GenerateTreeNodeUsecase implements IGenerateTreeNodeUsecase {
  @override
  List<TreeEntity> generate({
    required List<AssetEntity> listAssets,
    required List<LocationEntity> listLocations,
  }) {
    List<TreeEntity> listTreeNode = [];

    final unappreciatedCompenents =
        listAssets.where((element) => element.locationId == null).toList();

    if (unappreciatedCompenents.isNotEmpty) {
      for (var i = 0; i < unappreciatedCompenents.length; i++) {
        listTreeNode.add(
          TreeEntity(
            item: ItemEntity(
              id: unappreciatedCompenents[i].id,
              name: unappreciatedCompenents[i].name,
              sensorType: unappreciatedCompenents[i].sensorType,
              gatewayId: unappreciatedCompenents[i].gatewayId,
              sensorId: unappreciatedCompenents[i].sensorId,
              typeItem: TypeItemEnum.component,
            ),
            children: [],
          ),
        );
      }
    }

    for (var i = 0; i < listLocations.length; i++) {
      final location = listLocations[i];
      final assets = listAssets
          .where((element) => element.locationId == location.id)
          .toList();
      if (assets.isNotEmpty) {
        final node = location.copyWith(locationChildren: assets);
        listTreeNode.add(
          TreeEntity(
            item: ItemEntity(
              id: location.id,
              name: location.name,
              typeItem: TypeItemEnum.location,
            ),
            children: node.locationChildren,
          ),
        );
      } else if (assets.isEmpty && location.locationChildren.isNotEmpty) {
        for (var j = 0; j < location.locationChildren.length; j++) {
          final locationChild = location.locationChildren[j];
          final assets = listAssets
              .where((element) => element.locationId == locationChild.id)
              .toList();
          if (assets.isNotEmpty) {
            final node = location.copyWith(locationChildren: assets);
            listTreeNode.add(
              TreeEntity(
                item: ItemEntity(
                  id: location.id,
                  name: location.name,
                  typeItem: TypeItemEnum.location,
                ),
                children: node.locationChildren,
              ),
            );
          }
        }
      } else {
        listTreeNode.add(
          TreeEntity(
            item: ItemEntity(
              id: location.id,
              name: location.name,
              typeItem: TypeItemEnum.location,
            ),
            children: [],
          ),
        );
      }
    }
    return listTreeNode;
  }
}
