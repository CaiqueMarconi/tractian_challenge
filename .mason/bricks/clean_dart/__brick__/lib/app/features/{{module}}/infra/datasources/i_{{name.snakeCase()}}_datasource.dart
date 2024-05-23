
import '../helpers/params/{{params.snakeCase()}}_params.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';

abstract class I{{name.pascalCase()}}Datasource {
  Future<{{entities.pascalCase()}}Entity> call({{params.pascalCase()}}Params params);
}
