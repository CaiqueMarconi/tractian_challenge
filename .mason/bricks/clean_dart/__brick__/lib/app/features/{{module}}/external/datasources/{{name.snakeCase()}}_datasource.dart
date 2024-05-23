
import '../../infra/datasources/i_{{name.snakeCase()}}_datasource.dart';
import '../helpers/params/{{params.snakeCase()}}_params.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';


class {{name.pascalCase()}}Datasource implements I{{name.pascalCase()}}Datasource {

  const {{name.pascalCase()}}Datasource();

  @override
  Future<{{entities.pascalCase()}}Entity> call({{params.pascalCase()}}Params params) async {
    return;
  }
}
