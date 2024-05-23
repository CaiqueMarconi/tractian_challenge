import 'package:saga_home/app/features/{{module}}/presenter/stores/{{module.snakeCase()}}State.dart';


final class {{module.pascalCase()}}Store extends NewStore<{{module.pascalCase()}}State>{
  {{module.pascalCase()}}Store() : super({{module.pascalCase()}}State.init());
}