import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:model/app/features/home/external/mappers/asset_mapper.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../entities/asset_entity.dart';
import '../../helpers/params/get_assets_params.dart';
import '../../respositories/i_get_assets_repository.dart';
import 'i_get_assets_usecase.dart';

class GetAssetsUsecase implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  const GetAssetsUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<AssetEntity>>> call(
      GetAssetsParams params) async {
    final responseData = await _repository.call(params);

    final result = responseData.fold((l) => l, (r) => r);

    if (result is IAppFailure) return Left(result);

    final listMap = result as List<Map<String, dynamic>>;

    final listAssets = await compute(computeData, listMap);

    // Lista de componentes (ativos com sensorType)
    final listComponents =
        listAssets.where((element) => element.sensorType != null).toList();

    // Lista de ativos com uma localização como pai (locationId != null)
    final listAssetsParent =
        listAssets.where((element) => element.locationId != null).toList();

    // Lista de ativos filhos de outros ativos (parentId != null e sem sensorId)
    final listAssetsChildren =
        listAssets.where((element) => element.parentId != null).toList();

    // Adicionar filhos (ativos) aos ativos pais
    for (var i = 0; i < listAssetsChildren.length; i++) {
      final children = listAssetsChildren
          .where((element) => element.parentId == listAssetsChildren[i].id)
          .toList();

      // Atualizar os ativos filhos com sua lista de filhos
      listAssetsChildren[i] = listAssetsChildren[i].copyWith(
        children: children,
      );
    }

    // Adicionar filhos (ativos) aos ativos pais
    for (var i = 0; i < listAssetsParent.length; i++) {
      // Encontrar filhos para este ativo
      final children = listAssetsChildren
          .where((element) => element.parentId == listAssetsParent[i].id)
          .toList();

      // Atualizar o ativo pai com sua lista de filhos
      listAssetsParent[i] = listAssetsParent[i].copyWith(
        children: children,
      );
    }

    // adiciona os componentes que não são apreciados em nenhum lugar da arvore
    for (var i = 0; i < listComponents.length; i++) {
      if (listAssets[i].parentId == null && listAssets[i].locationId == null) {
        listAssetsParent.add(listAssets[i]);
      }
    }

    return Right(listAssetsParent);
  }
}

List<AssetEntity> computeData(List<Map<String, dynamic>> listMap) {
  return listMap.map((e) => AssetMapper.fromMap(e)).toList();
}
