import 'package:model/app/features/home/domain/entities/tree_entity.dart';

abstract class IGenerateTreeNodeUsecase {
  Future<List<TreeEntity>> generate({
    required String companyId,
  });
}
