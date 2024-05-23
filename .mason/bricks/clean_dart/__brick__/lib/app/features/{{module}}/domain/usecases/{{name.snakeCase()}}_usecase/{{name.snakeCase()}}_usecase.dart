import 'package:fpdart/fpdart.dart';

import '../../../../../core/shared/failures/i_app_failure.dart';
import '../../repositories/i_{{name.snakeCase()}}_repository.dart';
import 'i_{{name.snakeCase()}}_usecase.dart';
import '../helpers/params/{{params.snakeCase()}}_params.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Usecase implements I{{name.pascalCase()}}Usecase {
  final I{{name.pascalCase()}}Repository _repository;

  const {{name.pascalCase()}}Usecase(this._repository);

  @override
  Future<Either<IAppFailure, {{entities.pascalCase()}}Entity>> call({{params.pascalCase()}}Params params) async {
    return await _repository(params);
  }
}
