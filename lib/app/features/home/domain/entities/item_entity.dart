import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';

class ItemEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? sensorId;
  final TypeStateEnum? status;
  final String? gatewayId;
  final String? locationId;
  final TypeItemEnum typeItem;
  ItemEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorType,
    this.sensorId,
    this.status,
    this.gatewayId,
    this.locationId,
    required this.typeItem,
  });
}
