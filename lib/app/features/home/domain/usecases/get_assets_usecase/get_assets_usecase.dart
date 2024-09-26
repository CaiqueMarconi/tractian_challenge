import 'package:fpdart/fpdart.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/tree_entity.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../helpers/params/get_assets_params.dart';
import '../../respositories/i_get_assets_repository.dart';
import 'i_get_assets_usecase.dart';

class GetAssetsUsecase implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  const GetAssetsUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<TreeEntity>>> call(
      GetAssetsParams params) async {
    final responseData = await _repository.call(params);

    final result = responseData.fold((l) => l, (r) => r);

    if (result is IAppFailure) return Left(result);

    final listAssets = result as List<TreeEntity>;

    // List of components (assets with sensorType)
    final listComponents =
        listAssets.where((element) => element.item.sensorType != null).toList();

    // List of assets with a location as a parent (locationId != null)
    final listAssetsParent =
        listAssets.where((element) => element.item.locationId != null).toList();

    // List of assets that are children of other assets (parentId != null and no sensorId)
    final listAssetsChildren =
        listAssets.where((element) => element.item.parentId != null).toList();

    // Add children (assets) to parent assets
    for (var i = 0; i < listAssetsChildren.length; i++) {
      final children = listAssetsChildren
          .where((element) =>
              element.item.parentId == listAssetsChildren[i].item.id)
          .toList();

      // Atualizar os ativos filhos com sua lista de filhos
      listAssetsChildren[i] = listAssetsChildren[i].copyWith(
        children: children,
      );
    }

    for (var i = 0; i < listAssetsParent.length; i++) {
      // Find children for this asset
      final children = listAssetsChildren
          .where(
              (element) => element.item.parentId == listAssetsParent[i].item.id)
          .toList();

      // Update the parent asset with its list of children
      listAssetsParent[i] = listAssetsParent[i].copyWith(
        children: children,
      );
    }

    // adds components that are not liked anywhere in the tree
    for (var i = 0; i < listComponents.length; i++) {
      if (listAssets[i].item.parentId == null &&
          listAssets[i].item.locationId == null) {
        listAssetsParent.add(listAssets[i]);
      }
    }

    return Right(listAssetsParent);
  }
}
