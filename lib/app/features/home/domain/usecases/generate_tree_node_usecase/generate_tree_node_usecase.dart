import 'package:model/app/features/home/domain/entities/item_entity.dart';
import 'package:model/app/features/home/domain/entities/location_entity.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
import 'package:model/app/features/home/domain/usecases/generate_tree_node_usecase/i_generate_tree_node_usecase.dart';

class GenerateTreeNodeUsecase implements IGenerateTreeNodeUsecase {
  @override
  List<TreeEntity> generate({
    required List<TreeEntity> listAssets,
    required List<LocationEntity> listLocations,
  }) {
    List<TreeEntity> listTreeNode = [];

// Filter unappreciated components (assets without locationId)
    final unappreciatedCompenents =
        listAssets.where((element) => element.item.locationId == null).toList();

// Loop through all locations to create tree structure
    for (var i = 0; i < listLocations.length; i++) {
      final location = listLocations[i];
      // Filter assets that belong to the current location
      final assets = listAssets
          .where((element) => element.item.locationId == location.id)
          .toList();
      // If the location has associated assets
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
      // If the location has no assets but has location children
      else if (assets.isEmpty && location.locationChildren.isNotEmpty) {
        // Loop through each child location
        for (var j = 0; j < location.locationChildren.length; j++) {
          final locationChild = location.locationChildren[j];
          // Filter assets belonging to the current child location
          final assets = listAssets
              .where((element) => element.item.locationId == locationChild.id)
              .toList();
          // If child location has assets
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
      }
      // If the location has no assets and no children, add it as a node with empty children
      else {
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

// Add unappreciated components (without location) to the tree
    if (unappreciatedCompenents.isNotEmpty) {
      // Loop through unappreciated components
      for (var i = 0; i < unappreciatedCompenents.length; i++) {
        listTreeNode.add(
          TreeEntity(
            item: ItemEntity(
              id: unappreciatedCompenents[i].item.id,
              name: unappreciatedCompenents[i].item.name,
              sensorType: unappreciatedCompenents[i].item.sensorType,
              gatewayId: unappreciatedCompenents[i].item.gatewayId,
              sensorId: unappreciatedCompenents[i].item.sensorId,
              typeItem: TypeItemEnum.component,
              status: unappreciatedCompenents[i].item.status,
            ),
            children: [],
          ),
        );
      }
    }
    return listTreeNode;
  }
}
