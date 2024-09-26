import 'package:fpdart/fpdart.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/location_entity.dart';
import 'package:tractian_challenge/app/features/home/domain/helpers/params/get_location_params.dart';
import '../../../../../core/failures/app_failure/i_app_failure.dart';
import '../../respositories/i_get_location_repository.dart';
import 'i_get_location_usecase.dart';

class GetLocationUsecase implements IGetLocationUsecase {
  final IGetLocationRepository _repository;

  const GetLocationUsecase(this._repository);

  @override
  Future<Either<IAppFailure, List<LocationEntity>>> call(
      GetLocationParams params) async {
    final responseData = await _repository.call(params);

    final result = responseData.fold((l) => l, (r) => r);

    if (result is IAppFailure) return Left(result);

    final listLocation = result as List<LocationEntity>;

    // get location father another locations
    final listLocationParent =
        listLocation.where((element) => element.parentId == null).toList();

    // get location child another locations
    final listLocationChildren =
        listLocation.where((element) => element.parentId != null).toList();

    // add child locations to another child locations
    for (var i = 0; i < listLocationChildren.length; i++) {
      final childrens = listLocationChildren
          .where((element) => element.parentId == listLocationChildren[i].id)
          .toList();
      listLocationChildren[i] = listLocationChildren[i].copyWith(
        locationChildren: childrens,
      );
    }

    // add child locations to other parent locations
    for (var i = 0; i < listLocationParent.length; i++) {
      final childrens = listLocationChildren
          .where((element) => element.parentId == listLocationParent[i].id)
          .toList();
      listLocationParent[i] = listLocationParent[i].copyWith(
        locationChildren: childrens,
      );
    }

    return Right(listLocationParent);
  }
}
